package de.tu_dresden.inf.lat.om_planning.tools

object Tools {

  def setOfMaps[A,B](map: Map[A, Iterable[B]]): Set[Map[A,B]] = {
    def inner(list: List[(A, Iterable[B])], current: List[(A,B)]): Set[Map[A,B]] = list match {
      case Nil => Set(current.toMap[A,B])
      case (key, values)::tail => {
        values.flatMap { value =>
          inner(tail, (key,value)::current)
        }.toSet[Map[A,B]]
      }
    }
    inner(map.toList, List())
  }

}
