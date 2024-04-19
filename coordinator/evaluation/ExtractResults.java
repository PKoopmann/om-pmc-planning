

import java.io.File;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

enum Method {
    HORN,
    OM
}

class Result {
    public float reasoningTime=-1;
    public float planningTime=-1;
    public float totalTime=-1;
    public int planLength=-1;
    public int analyzedStates = -1;

    public boolean isSolved() {
        return totalTime > -1.0;
    }
}

class OMResult extends Result {
    public int ontologyAxioms = -1;
    public int hooks = -1;
    public int fluents = -1;
    public int repairs = -1;
}

class HornResult extends Result {};


// contains all the results for one benchmark instance, i.e., one planning problem
// might contain the results of several methods
class BenchmarkInstance {
    public String name;
    public List<Result> results;

    public BenchmarkInstance(String _name) {
        name = _name;
        results = new ArrayList<Result>();
    }

    public void addResult(Result r) {
        results.add(r);
    };

    // filter results by only including those from specific methods
    public BenchmarkInstance filterMethod(Method method) {
        BenchmarkInstance bi = new BenchmarkInstance(name);
        if (method == Method.OM) {
            for (var r : results){
                if (r instanceof  OMResult)
                    bi.addResult(r);
            }
        }
        else if (method == Method.HORN) {
            for (var r : results){
                if (r instanceof  HornResult)
                    bi.addResult(r);
            }
        }
        else {
            System.out.println("Error in filtering: method " + method + " is not known.");
        }
        return bi;
    }

    // dummy method for testing
    public float someTime() {
        for (var r : results)
            return r.reasoningTime;
       
        return 0;
    }

    // returns the number of times the benchmark was solved
    public int solved() {
        int s = 0;
        for (var r : results)
            if (r.isSolved())
                s += 1;

        return s;
    }

    // true, if some approach solved the benchmark
    public boolean someSolved() {
        return this.solved() > 0;
    }

    // true, if all approaches solved the benchmark
    public boolean allSolved() {
        return this.solved() == results.size();
    }

    public Result getSingletonResult() {
        assert(results.size() == 1);
        return results.get(0);
    }

    public boolean hasSolution(Method method) {
        for (var r : results) {
            if (r instanceof HornResult && method == Method.HORN)
                return true;
            if (r instanceof OMResult && method == Method.OM)
                return true;
        }
        return false;
    }

}

class BenchmarkSet {

    // maps names of benchmarks (i.e. planning problems) to the results
    private Map<String, BenchmarkInstance> data = new HashMap<String, BenchmarkInstance>();


    public void resetData() {
        data = new HashMap<String, BenchmarkInstance>();
    }

    public BenchmarkInstance getData(String key) {
        return data.get(key);
    }

    public void addData (String key, BenchmarkInstance bi) {
        data.put(key, bi);
    }

    public void addFromCSV (String path) {
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] values = line.split(",");
                String method = values[1];
                String name = values[2];
                if (method.startsWith("om_planning")) {
                    OMResult r = new OMResult();
                    try {
                        r.reasoningTime = Float.parseFloat(values[7]);
                    } catch (Exception e) {};
                    try {
                        r.planningTime = Float.parseFloat(values[8]);
                    } catch (Exception e) {};
                    try {
                        r.totalTime = Float.parseFloat(values[9]);
                    } catch (Exception e) {};
                    try {
                        r.planLength = Integer.parseInt(values[10]);
                    } catch (Exception e) {};
                    try {
                        r.analyzedStates = Integer.parseInt(values[11]);
                    } catch (Exception e) {};
                    try {
                        r.ontologyAxioms = Integer.parseInt(values[12]);
                    } catch (Exception e) {};
                    try {
                        r.hooks = Integer.parseInt(values[13]);
                    } catch (Exception e) {};
                    try {
                        r.fluents = Integer.parseInt(values[14]);
                    } catch (Exception e) {};
                    try {
                        r.repairs = Integer.parseInt(values[15]);
                    } catch (Exception e) {};

                    // add data row to the data collection
                    if (data.get(name)  != null) {
                        data.get(name).addResult(r);
                    }
                    else {
                        BenchmarkInstance bi = new BenchmarkInstance(name);
                        bi.addResult(r);
                        data.put(name, bi);
                    }
                }
                if (method.contains("horn_planning")) {
                    HornResult r = new HornResult();
                    try {
                        r.reasoningTime = Float.parseFloat(values[7]);
                    } catch (Exception e) {};
                    try {
                        r.planningTime = Float.parseFloat(values[8]);
                    } catch (Exception e) {};
                    try {
                        r.totalTime = Float.parseFloat(values[9]);
                    } catch (Exception e) {};
                    try {
                        r.planLength = Integer.parseInt(values[10]);
                    } catch (Exception e) {};
                    try {
                        r.analyzedStates = Integer.parseInt(values[11]);
                    } catch (Exception e) {};

                    // add data row to the data collection
                    if (data.get(name)  != null) {
                        data.get(name).addResult(r);
                    }
                    else {
                        BenchmarkInstance bi = new BenchmarkInstance(name);
                        bi.addResult(r);
                        data.put(name, bi);
                    }
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public BenchmarkSet filterNamePrefix(String prefix) {
        var filteredData = new BenchmarkSet();

        for (var entry : data.entrySet()) {
            // second part of condition: handles special case of our data where one benchmark name startes with 
            // the name of another one
            if (entry.getKey().startsWith(prefix) && 
                !entry.getKey().startsWith(prefix+"-roles") &&
                !entry.getKey().startsWith(prefix+"Conj"))
                filteredData.addData(entry.getKey(), entry.getValue());
        }

        return filteredData;
    }

    public BenchmarkSet filterMethod(Method method) {
        var filteredData = new BenchmarkSet();

        for (var entry : data.entrySet()) {
            var filteredResult = entry.getValue().filterMethod(method);
            filteredData.addData(entry.getKey(), filteredResult);
        }

        return filteredData;
    }

    public int countSuccess() {
        int success = 0;
        for (var benchmarkInstance : data.entrySet()) {
            if (benchmarkInstance.getValue().someSolved())
                success += 1;
        }
        return success;
    }

    public int size() {
        return data.size();
    }

    public float medianTimeCommon(Method method) {
        var times = new ArrayList<Float>();
        var filteredData = this.filterMethod(method);
        for (var bi : data.entrySet()) {
            // only consider commanly solved instances
            var instance = bi.getValue();
            if (instance.allSolved() && instance.hasSolution(method))
                times.add(filteredData.getData(bi.getKey()).getSingletonResult().totalTime);
            
        }
        return median(times);
    }

    public float medianPlanningTimeCommon(Method method) {
        var times = new ArrayList<Float>();
        var filteredData = this.filterMethod(method);
        for (var bi : data.entrySet()) {
            // only consider commanly solved instances
            var instance = bi.getValue();
            if (instance.allSolved() && instance.hasSolution(method))
                times.add(filteredData.getData(bi.getKey()).getSingletonResult().planningTime);
            
        }
        return median(times);
    }

    public float medianReasoningTimeCommon(Method method) {
        var times = new ArrayList<Float>();
        var filteredData = this.filterMethod(method);
        for (var bi : data.entrySet()) {
            // only consider commanly solved instances
            var instance = bi.getValue();
            if (instance.allSolved() && instance.hasSolution(method))
                times.add(filteredData.getData(bi.getKey()).getSingletonResult().reasoningTime);
            
        }
        return median(times);
    }

    static float median(List<Float> list) {
        if (list.isEmpty())
            return (float) -1.0;
        float[] x = new float[list.size()];
        for(int i = 0; i < list.size(); i++) x[i] = list.get(i);
        var n = x.length;
        if (n % 2 != 0)
            return  x[n / 2];
        return   (x[(n - 1) / 2] + x[n / 2]) / (float) 2.0;
    }
}

class CSVWriter {
    public String escapeSpecialCharacters(String data) {
        if (data == null) {
            throw new IllegalArgumentException("Input data cannot be null");
        }
        String escapedData = data.replaceAll("\\R", " ");
        if (data.contains(",") || data.contains("\"") || data.contains("'")) {
            data = data.replace("\"", "\"\"");
            escapedData = "\"" + data + "\"";
        }
        return escapedData;
    }

    public String convertToCSV(String[] data) {
        return Stream.of(data)
            .map(this::escapeSpecialCharacters)
            .collect(Collectors.joining(","));
    }

    public void writeArrayToCSV(String fileName, List<String[] > dataLines) throws IOException {
        File csvOutputFile = new File(fileName);
        try (PrintWriter pw = new PrintWriter(csvOutputFile)) {
            for (var line : dataLines) {
                pw.println(convertToCSV(line));
            }
        }
        assert(csvOutputFile.exists());
    }
}

public class ExtractResults {

    

    public static void main(String[] args) {
        var rawData = new BenchmarkSet();

        // DL benchmark
        rawData.addFromCSV("../../benchmark_runs/benchmarking/benchmarkAll_BasicOM_2024_04_15.csv");

        // new method
        //rawData.addFromCSV("../../benchmark_runs/benchmarking/benchmarkAll_2024_01_17_15_51.csv");

        var droneData = rawData.filterNamePrefix("drone");
        var droneOMData = droneData.filterMethod(Method.OM);

        System.out.println(droneData.medianTimeCommon(Method.OM));

        String[] benchmarkNames = {
            "cats",
            "elevator",
            "robot",
            "taskAssign",
            "tpsa",
            "vta",
            "vta-roles",
            "drones",
            "queens",
            "robotConj",
            "blocksworld",
            "pipes"
        };

        List<String[]> output = new ArrayList<String[]>();

        String[] head = {
            "name",
            "#examples",
            "#solvedHorn",
            "#solvedOM",
            "timeHorn",
            "timeOM",
            "compilationTimeHorn",
            "reasoningTimeOM",
            "planningTimeHorn",
            "planningTimeOM"
        };

        output.add(head);

        for (var benchmarkName : benchmarkNames) {
            var bData = rawData.filterNamePrefix(benchmarkName);
            var bOmData = bData.filterMethod(Method.OM);
            var bHornData = bData.filterMethod(Method.HORN);

            var size = bData.size();
            var solvedHorn = bHornData.countSuccess();
            var solvedOM = bOmData.countSuccess();

            var timeHorn = bData.medianTimeCommon(Method.HORN);
            var timeReasoningHorn = bData.medianReasoningTimeCommon(Method.HORN);
            var timePlanningHorn = bData.medianPlanningTimeCommon(Method.HORN);

            var timeOM = bData.medianTimeCommon(Method.OM);
            var timeReasoningOM = bData.medianReasoningTimeCommon(Method.OM);
            var timePlanningOM = bData.medianPlanningTimeCommon(Method.OM);

            String[] line = {
                benchmarkName,
                String.valueOf(size),
                String.valueOf(solvedHorn),
                String.valueOf(solvedOM),
                String.valueOf(timeHorn),
                String.valueOf(timeOM),
                String.valueOf(timeReasoningHorn),
                String.valueOf(timeReasoningOM),
                String.valueOf(timePlanningHorn),
                String.valueOf(timePlanningOM),
            };

            output.add(line);

            System.out.println(benchmarkName + " OM: " + bOmData.countSuccess() + " Horn: " + bHornData.countSuccess());

        }

        var csvWriter = new CSVWriter();

        try {
            csvWriter.writeArrayToCSV("temp.csv", output);

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
