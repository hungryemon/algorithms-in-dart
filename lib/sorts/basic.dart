import "package:algorithms_in_dart/heaps/binary_heap.dart"
    show BinaryHeap, Comparer;

bool ascendingFn(a, b) => a <= b;

/// The mighty Bubble Sort!
List<T> bubbleSort<T>(List<T> list, [Comparer compareFn = ascendingFn]) {
  var size = list.length;

  for (var i = 0; i < size; i++) {
    for (var j = 1; j < (size - i); j++) {
      if (!compareFn(list[j - 1], list[j])) {
        var temp = list[j - 1];
        list[j - 1] = list[j];
        list[j] = temp;
      }
    }
  }

  return list;
}

/// Insertion Sort
List<T> insertionSort<T>(List<T> list, [Comparer compareFn = ascendingFn]) {
  for (var i = 1; i < list.length; i++) {
    var key = list[i];
    var j = i - 1;
    while (j >= 0 && !compareFn(list[j], key)) {
      list[j + 1] = list[j];
      j--;
    }

    list[j + 1] = key;
  }
  return list;
}

/// HeapSort
List<T> heapSort<T>(List<T> list, [Comparer compareFn = ascendingFn]) {
  var sortedList = <T>[];
  var heap = BinaryHeap(compareFn)..insertMany(list);

  while (heap.length != 0) sortedList.add(heap.pop());

  return sortedList;
}
