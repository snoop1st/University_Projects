import java.io.PrintStream;
import java.util.NoSuchElementException;

public class StringStackImpl implements StringStack { // Dilonoume thn klasi StringStackImpl
    private Node head;
    int cnt;

    private class Node {
        String data;
        Node next;

        Node(String data, Node next) 
		{
            this.data = data;
            this.next = next;
        }
    }

    StringStackImpl() {
		cnt = 0;
        head = null;
    }

    public boolean isEmpty() {
        return (head == null);
    }

    public void push(String data) {
        head = new Node(data, head);
        cnt++;
    }

    public String pop() throws NoSuchElementException {
		String str;
        if(head == null)
            throw new NoSuchElementException("is empty");
        else 
		{
			str = head.data;
            head = head.next;
            cnt--;
			return str;
        }
    }

    public void printStack(PrintStream stream) {
		Node tmp = head;
        while(tmp != null) 
		{
            stream.println(tmp.data);
            tmp = tmp.next;
        }

    }

    public String peek() throws NoSuchElementException {
        if(head == null)
            throw new NoSuchElementException("is empty");
        else
            return head.data;
    }
	
    public int size() {
        return cnt;
    }

    public static void main(String[] args) {
		boolean d;
		int s;		
        StringStackImpl st = new StringStackImpl();
		st.push("nai");
		System.out.println(st.pop());
		
		
		String b = st.peek();
		

		
    }
}