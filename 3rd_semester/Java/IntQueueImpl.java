import java.io.PrintStream;
import java.util.NoSuchElementException;

public class IntQueueImpl implements IntQueue{
	private Node head, tail;
	int cnt;
	
	private class Node { 
		int data; 
		Node next; 
		Node(int data) { 
			this.data = data; 
			next = null; 
			}
		} 
			
	IntQueueImpl() {
		cnt = 0;
		head = null;
		tail = null;   
    }
	
	public boolean isEmpty(){
		return(head == null);
	}
	
	public void put(int data){
		 
		Node t = tail; 
		tail = new Node(data); 
		cnt++;
		if(isEmpty())
			head = tail; 
		else
			t.next = tail;

	}
	public int get() throws NoSuchElementException{ 
		if(head == null)
            throw new NoSuchElementException("is empty");
		else
		{
		int v = head.data;  
		head = head.next; 
		cnt--;
		return v;
		}	
	}
	
	public void printQueue(PrintStream stream){
		Node tmp = head;
        while(tmp != null) 
		{
            stream.println(tmp.data);
            tmp = tmp.next;
        }

    }
		
	
	public int peek() throws NoSuchElementException{
		if(head == null)
            throw new NoSuchElementException("is empty");
        else
            return head.data;
	}
	
	public int size() {
        return cnt;
    }
	



public static void main(String[] args) {
		int s,x;
		boolean z;
        IntQueueImpl st = new IntQueueImpl();
		st.put(3);
		st.put(10);
		st.printQueue(System.out);
		//s = st.peek();
		//z = st.isEmpty();
		x = st.size();
		System.out.println(x);
		st.get();
		x = st.size();
		System.out.println(x);
		st.get();
		x = st.size();
		System.out.println(x);
		st.get();
		x = st.size();
		System.out.println(x);
		//System.out.println(z);
		//System.out.println(s);
		
		
		
		

		
    }
}






