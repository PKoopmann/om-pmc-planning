

import java.io.File;
import java.util.*;
import java.io.BufferedReader;
import java.io.FileReader;


class Result {
    public float reasoningTime=-1;
    public float planningTime=-1;
    public float totalTime=-1;
    public int planLength=-1;
    public int analyzedStates = -1;
}

class OMResult extends Result {
    public int ontologyAxioms = -1;
    public int hooks = -1;
    public int fluents = -1;
    public int repairs = -1;
}

class HornResult extends Result {};

class BenchmarkInstance {
    public String name;
    public List<Result> results;

    public BenchmarkInstance(String _name) {
        name = name;
        results = new ArrayList<Result>();
    }

    public void addResult(Result r) {
        results.add(r);
    };

    // dummy method for testing
    public float someTime() {
        for (var r : results)
            return r.reasoningTime;
        return 0;
    }

}

public class ExtractResults {
    static Map<String, BenchmarkInstance> data = new HashMap<String, BenchmarkInstance>();

    static void readCSV (String path) {
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] values = line.split(",");
                String method = values[1];
                String name = values[2];
                if (method.contains("om_planning")) {
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

    public static void main(String[] args) {
        readCSV("../benchmark_runs/benchmarking/benchmarkAll_2023_05_11_15_08.csv");
        for (Map.Entry<String, BenchmarkInstance> entry : data.entrySet()) {
            System.out.println(entry.getKey() + " " + entry.getValue().someTime());
        }
    }
}