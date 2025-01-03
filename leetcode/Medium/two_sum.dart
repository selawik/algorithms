class ListNode {
  int val;
  ListNode? next;

  ListNode([this.val = 0, this.next]);
}

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  var hasOverflow = false;
  var resultHead = null;
  var nextNode = null;

  while (l1 != null || l2 != null) {
    var sum = (l1?.val ?? 0) + (l2?.val ?? 0);

    if (hasOverflow) {
      sum++;
      hasOverflow = false;
    }

    if (sum > 9) {
      hasOverflow = true;
      sum -= 10;
    }

    final newNextNode = ListNode(sum, null);

    if (resultHead == null) {
      resultHead = newNextNode;
    }

    nextNode?.next = newNextNode;
    nextNode = newNextNode;
    l1 = l1?.next;
    l2 = l2?.next;
  }

  if (hasOverflow) {
    nextNode.next = ListNode(1);
  }

  return resultHead;
}
