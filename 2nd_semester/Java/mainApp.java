// ARITHMOS OMADAS: 79
// Evgenia-Maria Tseliki 3200207
// Nikos Sokolis 3200179

import java.util.Scanner;
import java.util.*;
import java.io.*;

class Expense_Type // Typos Dapanhs.
{
	int code;
	String descr;
	double max_fee;

	public Expense_Type(int code, String descr, double max_fee)
	{
		this.code = code;
		this.descr = descr;
		this.max_fee = max_fee;
	}
}

class Expense_Type_1 extends Expense_Type
{
	double fee;
	String unit;

	public Expense_Type_1(int code, String descr, double max_fee, double fee, String unit)
	{
		super(code, descr, max_fee);
		this.fee = fee;
		this.unit = unit;
	}
	public String toString() // Kaleitai otan ektiponoume ena antikeimeno ths klashs.
	{
		return String.format("Code:%d Descr:%s Max_Fee:%.2f Fee_Unit:%.2f Unit:%s\n", 
			code, descr, max_fee, fee, unit);
	}
}

class Expense_Type_2 extends Expense_Type
{
	double rate;

	public Expense_Type_2(int code, String descr, double max_fee, double rate)
	{
		super(code, descr, max_fee);
		this.rate = rate;
	}
	public String toString() 
	{
		return String.format("Code:%d Descr:%s Max_Fee:%.2f Rate:%.2f\n",
			code, descr, max_fee, rate);
	}
}

class Employee // Ypallhlos.
{
	boolean clear; // Dhlonei an egine ekkatharisi or not.
	int code;
	String last_name;
	String first_name;
	double credit; // Pistotiko ypoloipo.
	double advance; // Prokatavolh.
	double sum_fee; // Synolo olvn tvn apozimiosevn toy ypallhloy.
	double month_fee; // Telikh mhniaia apozimiosh.
	double max_month_fee; // Megisth mhniaia apozimiosh.
	
	public Employee()
	{
	}
	public Employee(int code, String last_name, String first_name, double max_month_fee)
	{
		this.code = code;
		this.last_name = last_name;
		this.first_name = first_name;
		this.max_month_fee = max_month_fee;
		credit = 0;
		advance = 0;
		month_fee = 0;
		sum_fee = 0;
		clear = false;
	}
	// Ekkatharisi ths dapanhs me kodiko exp_code. 
	public void clear_exp_fee(int exp_code, double exp_value, Vector<Expense_Type> vec_exp_type, Vector<Fee_Employee> vec_fee_emp)
	{
		boolean found;
		int i, type;
		double fee, tmp;
		Expense_Type exp_type;

		for(i = 0; i < vec_exp_type.size(); i++) // Psaxnoume na vroume ton kodiko the dapanhs mesa ston pinaka me tis dapanes.
		{
			exp_type = vec_exp_type.get(i);
			if(exp_type.code == exp_code)
			{
				// Ypologizoume thn apozimiosh analoga me ton typo ths dapanhs.
				if(exp_type instanceof Expense_Type_1)
				{
					type = 1;
					tmp = ((Expense_Type_1)exp_type).fee;
				}
				else
				{
					type = 2;
					tmp = ((Expense_Type_2)exp_type).rate;
				}
				fee = exp_value * tmp;
				tmp = exp_type.max_fee;
				if(tmp != 0)
				{
					if(fee > tmp)
						fee = tmp;
				}
				found = false;
				// Kataxvroume thn apozimiosh gia ton sygkekrimeno ypallhlo kai kodiko exp_code ston pinaka  
				// me tis kinhseis tou ergazomenou.
				for(i = 0; i < vec_fee_emp.size(); i++)
				{
					Fee_Employee fee_emp = vec_fee_emp.get(i);
					if(fee_emp.emp == this) // Sygkrinoume me this gia na vroume ton sygkekrimeno ypallhlo.
					{
						// An yparxei hdh apozimiosh gia thn sygkekrimenh dapanh (p.x. exei polla odoiporika), kanoyme update to poso.
						if(fee_emp.exp_code == exp_code)
						{
							fee_emp.fee += fee;
							found = true;
							break;
						}
					}
				}
				// An den yparxei kataxvrhsh gia thn apozimiosh, dhmiourgoume ena Fee_Employee antikeimeno me ton sygkekrimeno ypallhlo (this)
				// kai to vazoume ston pinaka.
				if(found == false)
					vec_fee_emp.add(new Fee_Employee(this, type, exp_code, exp_type.descr, fee));
				
				sum_fee += fee;
				return;
			}
		}
	}		
	public void set_clear(boolean clear)
	{
		this.clear = clear;
		if(clear == false)
			sum_fee = 0;
	}
	public void calc_month_fee() // Ypologizoume thn mhniaia apozimiosh.
	{
		month_fee = sum_fee - advance + credit;
		if(month_fee > max_month_fee) // An xeperasei thn megisth, dhmiourgeitai pistotiko ypoloipo.
		{
			credit = month_fee - max_month_fee;
			month_fee = max_month_fee;
		}
		else
			credit = 0;
	}
	public void update_sum_fee(double fee)
	{
		sum_fee += fee;
	}
	public void set_advance(double advance)
	{
		this.advance = advance;
	}
	public void set_credit(double credit)
	{
		this.credit = credit;
	}
	public void set_month_fee(double month_fee)
	{
		this.month_fee = month_fee;
	}
	public String toString() 
	{
		return String.format("%s\t%s\t\t%.2f\t\t%.2f\n", last_name, first_name, month_fee, credit);
	}
}

class Expense_Employee // Dapanh ergazomenou.
{
	Employee emp;
	int exp_type;
	int exp_code;
	double exp_value; // Axia or posothta dapanhs.
	String exp_cause;
	
	public Expense_Employee(Employee emp, int exp_type, int exp_code, double exp_value, String exp_cause)
	{
		this.emp = emp;
		this.exp_type = exp_type;
		this.exp_code = exp_code;
		this.exp_value = exp_value;
		this.exp_cause = exp_cause;
	}
	public String toString() 
	{
		return String.format("%s\t%d\t\t%d\t\t%.2f\t\t%s\n", emp.last_name, exp_type, exp_code, exp_value, exp_cause);
	}
}

class Fee_Employee // Kinhsh ergazomenou (exei ta pedia: ypallhlos, typos_dapanhs, kodikos_dapanhs, perigrafh_dapanhs (p.x. odoiporika), apozimiosh).
{
	Employee emp;
	int exp_type;
	int exp_code;
	String descr;
	double fee;
	
	public Fee_Employee(Employee emp, int exp_type, int exp_code, String descr, double fee)
	{
		this.emp = emp;
		this.exp_type = exp_type;
		this.exp_code = exp_code;
		this.descr = descr;
		this.fee = fee;
	}
	public String toString() 
	{
		return String.format("%s\t%d\t\t%s\t%.2f\n", emp.last_name, exp_code, descr, fee);
	}
}

public class mainApp 
{
	// Xrhsimopoioume thn Vector syllogh gia thn apothikeush tvn antikeimenvn.
	static Vector<Expense_Type> vec_exp_type; 
	static Vector<Employee> vec_emp;
	static Vector<Expense_Employee> vec_exp_emp;
	static Vector<Fee_Employee> vec_fee_emp;
	static Scanner input;
	
	public static void main(String args[]) 
	{
		boolean found;
		int i, id, sel, code, type;
		String descr, unit, last_name, first_name, exp_cause;
		double advance, max_fee, fee, rate, max_month_fee, exp_value, all_fees;
		Employee emp;
		
		input = new Scanner(System.in); 
		vec_exp_type = new Vector<Expense_Type>();
		vec_emp = new Vector<Employee>();
		vec_exp_emp = new Vector<Expense_Employee>();
		vec_fee_emp = new Vector<Fee_Employee>();
		
		read_exp_types(vec_exp_type);
		read_emp(vec_emp);
		read_exp_emp(vec_emp, vec_exp_type, vec_exp_emp);
		read_fee_emp(vec_emp, vec_exp_type, vec_fee_emp);
		
		// O pinakas vec_fee_emp tvn apozimiosevn ana ergazomeno kai ana typo dapanhs arxikopoieitai me thn epilogh_6 apo to menu.
		System.out.println("\nProgram Operations");
		System.out.println("--------------------");
		
		System.out.println("1. Add Expense Type");
		System.out.println("2. Add Employee");
		System.out.println("3. Add Employee Expense");
		System.out.println("4. Add Employee Advance");
		System.out.println("5. Show Expenses of all Employees");
		System.out.println("6. Clear Employee Expenses");
		System.out.println("7. Show Employee Expenses");
		System.out.println("8. Clear Expenses of all Employees");
		System.out.println("9. Show Fees of all Employees");
		System.out.println("10. Save Expenses of all Employees");
		System.out.println("11. Save Fees of all Employees");		
		System.out.println("12. Exit");

		while(true)
		{
			System.out.print("\nSelect option: ");
			sel = input.nextInt();

			switch(sel)
			{
				case 1:
					System.out.print("\nAvailable Expense Types\n");
					System.out.print("-------------------------\n");

					for(i = 0; i < vec_exp_type.size(); i++)
						System.out.print(vec_exp_type.get(i));
					
					System.out.print("\nEnter expense code: ");
					code = input.nextInt();

					input.nextLine();
					System.out.print("Enter description(text): ");
					descr = input.nextLine();
					
					System.out.print("Enter max fee: ");
					max_fee = input.nextDouble();
					
					System.out.print("Enter type(1 or 2): ");
					type = input.nextInt();
					if(type == 1)
					{
						System.out.print("Enter fee per unit: ");
						fee = input.nextDouble();
						
						input.nextLine();
						System.out.print("Enter unit(text): ");
						unit = input.nextLine();
						// Dhmiourgia antikeimenou typou dapanhs kai apothikeushs ston pinaka.
						vec_exp_type.add(new Expense_Type_1(code, descr, max_fee, fee, unit)); 
					}
					else
					{
						System.out.print("Enter rate: ");
						rate = input.nextDouble();
						vec_exp_type.add(new Expense_Type_2(code, descr, max_fee, rate));
					}
				break;

				case 2:
					System.out.print("\nEnter code: ");
					code = input.nextInt();

					input.nextLine();
					
					System.out.print("Enter last name: ");
					last_name = input.nextLine();

					System.out.print("Enter first name: ");
					first_name = input.nextLine();
					
					System.out.print("Enter max month fee: ");
					max_month_fee = input.nextDouble();
					
					vec_emp.add(new Employee(code, last_name, first_name, max_month_fee));
				break;
				
				case 3:
					id = select_employee();
					emp = vec_emp.get(id);

					if(emp.clear == false)
					{
						System.out.print("Enter expense code: ");
						code = input.nextInt();
						
						found = false;
						for(i = 0; i < vec_exp_type.size(); i++)
						{
							Expense_Type exp_type = vec_exp_type.get(i); // Psaxnoume ston pinaka tvn dapanvn gia na vroume thn sygkekrimenh dapanh.
							if(exp_type.code == code)
							{
								if(exp_type instanceof Expense_Type_1)
								{
									System.out.print("Enter quantity: ");
									exp_value = input.nextDouble();
									type = 1;
								}
								else
								{
									System.out.print("Enter value: ");
									exp_value = input.nextDouble();
									type = 2;
								}
								input.nextLine();
								System.out.print("Enter cause(text): ");
								exp_cause = input.nextLine();
								// Dhmiourgia antikeimenou dapanhs_ergazomenou kai apothikeushs ston pinaka.
								vec_exp_emp.add(new Expense_Employee(vec_emp.get(id), type, code, exp_value, exp_cause));
								found = true;
							}
						}
						if(found == false)
							System.out.println("Error: this expense code does not exist");
					}
					else
						System.out.println("\nError: Expenses of employee_" + (id+1) + " have already been cleared and stored into the file");
				break;

				case 4:
					id = select_employee();
					
					System.out.print("Enter advance: ");
					advance = input.nextDouble();
					
					vec_emp.get(id).set_advance(advance);
				break;
				
				case 5:
					if(vec_exp_emp.isEmpty())
						System.out.println("\nThere are no expenses");
					else
					{
						System.out.print("\nLast_Name\tExp_Type\tExp_Code\tExp_Value\tExp_Cause\n");
						for(i = 0; i < vec_exp_emp.size(); i++)
							System.out.print(vec_exp_emp.get(i)); 
					}
				break;
				
				case 6:
					id = select_employee();
					
					emp = vec_emp.get(id);
					found = false;
					if(emp.clear == false)
					{
						for(i = 0; i < vec_exp_emp.size(); i++)
						{
							Expense_Employee exp_emp = vec_exp_emp.get(i);
							if(exp_emp.emp == emp) // Ekkatharizoume tis dapanes gia ton ypallhlo pou epelexe o xrhsths.
							{
								found = true;
								emp.clear_exp_fee(exp_emp.exp_code, exp_emp.exp_value, vec_exp_type, vec_fee_emp);
							}
						}
						if(found)
						{
							emp.set_clear(true);
							System.out.println("\nExpenses of employee_" + (id+1) + " are cleared");
						}
						else
							System.out.println("\nEmployee_" + (id+1) + " has no expenses");
					}
					else
						System.out.println("\nError: Expenses of employee_" + (id+1) + " have already been cleared");
				break;

				case 7:
					id = select_employee();
					
					System.out.println("\nName\t\tExp_Code\tDescription\tFee");
					emp = vec_emp.get(id);
					found = false;
					for(i = 0; i < vec_fee_emp.size(); i++)
					{
						Fee_Employee fee_emp = vec_fee_emp.get(i);
						if(fee_emp.emp == emp) // Emfanizoume tis dapanes gia ton ypallhlo pou epelexe o xrhsths.
						{
							found = true;
							System.out.print(fee_emp);
						}
					}
					if(found == false)
						System.out.println("Error: Expenses must be first cleared");
				break;
				
				case 8:
					for(i = 0; i < vec_exp_emp.size(); i++)
					{
						Expense_Employee exp_emp = vec_exp_emp.get(i);
						if(exp_emp.emp.clear == false) // Ekkatharizoume tis dapanes gia ton ypallhlo mono an den exoun ekkatharistei.
							exp_emp.emp.clear_exp_fee(exp_emp.exp_code, exp_emp.exp_value, vec_exp_type, vec_fee_emp);
					}
					for(i = 0; i < vec_emp.size(); i++)
						vec_emp.get(i).set_clear(true);

					System.out.println("\nExpenses of all employees are cleared");
				break;
				
				case 9:
					if(vec_fee_emp.isEmpty())
					{
						System.out.println("\nThere are no final expenses");
						break;
					}
					System.out.println();
					found = false;
					// Prvta elegxoume an exoun ekkatharistei oi dapanes gia olous tous ypallhlous.
					for(i = 0; i < vec_emp.size(); i++)
					{
						emp = vec_emp.get(i);
						if(emp.clear == false)
						{
							System.out.println("Error: Expenses of all employees must be first cleared");
							found = true;
							break;
						}
					}
					if(found == false)
					{
						System.out.println("Last_Name\tFirst_Name\tMonth_Fee\tCredit");						
						all_fees = 0;
						for(i = 0; i < vec_emp.size(); i++)
						{
							emp = vec_emp.get(i);
							emp.calc_month_fee(); // Ypologizoume thn synolikh apozimiosh tou kathe ypallhloy.
							System.out.print(emp);
							all_fees += emp.month_fee;
						}
						System.out.println("\nTotal Fees: " + all_fees);
						// Diagrafoume oles tis dapanes kai apozimioseis.
/*						vec_exp_emp.clear();
						vec_fee_emp.clear();
						for(i = 0; i < vec_emp.size(); i++)
							vec_emp.get(i).set_clear(false);*/
					}
				break;

				case 10:
					try 
					{
						FileWriter fw = new FileWriter("expense_employee.txt"); // Anoigoume to arxeio gia na grapsoums se auto, symfvna me to Pararthma.
						BufferedWriter buff = new BufferedWriter(fw);

						buff.write("EXPENSE_LIST\n");
						buff.write("{\n");
						
						// Vriskoume tis dapanes ston pinaka vec_exp_emp gia ton kathe ypallhlo kai tis ekkatharizoume.
						for(i = 0; i < vec_exp_emp.size(); i++)
						{
							Expense_Employee exp_emp = vec_exp_emp.get(i);
							if(exp_emp.emp.clear == false) // Ekkatharizoume tis dapanes gia ton ypallhlo mono an den exoun ekkatharistei.
								exp_emp.emp.clear_exp_fee(exp_emp.exp_code, exp_emp.exp_value, vec_exp_type, vec_fee_emp);

							buff.write("\tEXPENSE\n");
							buff.write("\t{\n");
							buff.write("\t\tEMPLOYEE_CODE\t");
							buff.write(String.valueOf(exp_emp.emp.code));
							buff.write("\n\t\tEXPENSE_TYPE\t");
							buff.write(String.valueOf(exp_emp.exp_type));
							buff.write("\n\t\tEXPENSE_CODE\t");
							buff.write(String.valueOf(exp_emp.exp_code));
							buff.write("\n\t\tVAL\t");
							buff.write(String.valueOf(exp_emp.exp_value));
							buff.write("\n\t\tCAUSE\t");
							buff.write(exp_emp.exp_cause);
							buff.write("\n\t}\n");
						}
						buff.write("}\n");
						buff.close(); // Kleinoume to arxeio.
					}
					catch(IOException e)
					{
						System.out.println("\nFile error: " + e.toString());
					}
				return; // Termatismos efarmoghs.

				case 11:
					// Prvta vriskoume tis dapanes ston pinaka vec_exp_emp gia ton kathe ypallhlo kai tis ekkatharizoume.
					for(i = 0; i < vec_exp_emp.size(); i++)
					{
						Expense_Employee exp_emp = vec_exp_emp.get(i);
						if(exp_emp.emp.clear == false) // Ekkatharizoume tis dapanes gia ton ypallhlo mono an den exoun ekkatharistei.
							exp_emp.emp.clear_exp_fee(exp_emp.exp_code, exp_emp.exp_value, vec_exp_type, vec_fee_emp);
					}
					try 
					{
						FileWriter fw = new FileWriter("fee_employee.txt"); // Anoigoume to arxeio gia na grapsoums se auto, symfvna me to Pararthma.
						BufferedWriter buff = new BufferedWriter(fw);

						buff.write("TRN_LIST\n");
						buff.write("{\n");

						for(i = 0; i < vec_fee_emp.size(); i++)
						{
							Fee_Employee fee_emp = vec_fee_emp.get(i);

							buff.write("\tTRN\n");
							buff.write("\t{\n");
							buff.write("\t\tEMPLOYEE_CODE\t");
							buff.write(String.valueOf(fee_emp.emp.code));
							buff.write("\n\t\tTYPE\t\"PROKATAVOLI\"");
							buff.write("\n\t\tVAL\t");
							buff.write(String.valueOf(fee_emp.emp.advance));
							buff.write("\n\t}\n");

							buff.write("\tTRN\n");
							buff.write("\t{\n");
							buff.write("\t\tEMPLOYEE_CODE\t");
							buff.write(String.valueOf(fee_emp.emp.code));
							buff.write("\n\t\tTYPE\t\"APOZIMIOSI\"");
							buff.write("\n\t\tEXPENSE_TYPE\t");
							buff.write(String.valueOf(fee_emp.exp_type));
							buff.write("\n\t\tEXPENSE_CODE\t");
							buff.write(String.valueOf(fee_emp.exp_code));
							buff.write("\n\t\tVAL\t");
							buff.write(String.valueOf(fee_emp.fee)); // Grafoume thn apozimiosh gia thn sygkekrimenh dapanh.
							buff.write("\n\t}\n");

							for(i = i+1; i < vec_fee_emp.size(); i++) // Synexizoume na psaxnoume sto vec_fee_emp gia to an 
							// o idios ypallhlos exei kai alles apozimioseis apo alles dapanes.
							{
								Fee_Employee tmp = vec_fee_emp.get(i);
								if(tmp.emp == fee_emp.emp) 
								{
									buff.write("\tTRN\n");
									buff.write("\t{\n");
									buff.write("\t\tEMPLOYEE_CODE\t");
									buff.write(String.valueOf(tmp.emp.code));
									buff.write("\n\t\tTYPE\t\"APOZIMIOSI\"");
									buff.write("\n\t\tEXPENSE_TYPE\t");
									buff.write(String.valueOf(tmp.exp_type));
									buff.write("\n\t\tEXPENSE_CODE\t");
									buff.write(String.valueOf(tmp.exp_code));
									buff.write("\n\t\tVAL\t");
									buff.write(String.valueOf(tmp.fee)); // Grafoume thn apozimiosh gia thn sygkekrimenh dapanh.
									buff.write("\n\t}\n");
								}
								else // Vrikame neo ypallhlo, ara meionoume to i kata 1, afou tha auxithei sto exoteriko for.
								{
									i = i-1; 
									break;
								}
							}
							fee_emp.emp.calc_month_fee(); // Ypologizoume thn synolikh mhniaia apozimiosh.
							
							buff.write("\tTRN\n");
							buff.write("\t{\n");
							buff.write("\t\tEMPLOYEE_CODE\t");
							buff.write(String.valueOf(fee_emp.emp.code));
							buff.write("\n\t\tTYPE\t\"DIAFORA\"");
							buff.write("\n\t\tVAL\t");
							buff.write(String.valueOf(fee_emp.emp.credit));
							buff.write("\n\t}\n");
							
							buff.write("\tTRN\n");
							buff.write("\t{\n");
							buff.write("\t\tEMPLOYEE_CODE\t");
							buff.write(String.valueOf(fee_emp.emp.code));
							buff.write("\n\t\tTYPE\t\"FINAL_APOZIMIOSI\"");
							buff.write("\n\t\tVAL\t");
							buff.write(String.valueOf(fee_emp.emp.month_fee));
							buff.write("\n\t}\n");
						}
						buff.write("}\n");						
						buff.close(); // Kleinoume to arxeio.
					}
					catch(IOException e)
					{
						System.out.println("\nFile error: " + e.toString());
					}
				return; // Termatismos efarmoghs.
				
				case 12:
				return; // Termatismos efarmoghs.
				
				default:
					System.out.println("\nWrong option!!! ");
				break;
			}
		}
	}
	static int select_employee()
	{
		int i, id;
		
		System.out.println("\nEmployees");
		System.out.println("---------");					
		for(i = 0; i < vec_emp.size(); i++)
			System.out.println(i+1 + ". " + vec_emp.get(i).last_name + " " + vec_emp.get(i).first_name); 

		System.out.print("\nSelect employee (1-" + vec_emp.size() + "): ");
		id = input.nextInt();
		id--; // Afairoume to 1 epeidh h arithmhsh stous pinakes arxizei apo 0.
		return id;
	}
	static void read_exp_types(Vector<Expense_Type> vec_exp_type)
	{
		try
		{
			boolean eof;
			int type, code;
			double max_fee, unit_fee, rate;
			StringTokenizer lineTokens;
			String line, token, descr, unit_text;

			FileReader fr = new FileReader("expense_list.txt"); // Anoigoume to arxeio gia na diavasoume apo auto, symfvna me to Pararthma.
			BufferedReader buff = new BufferedReader(fr);
			eof = false;
			while(eof == false)
			{
				line = buff.readLine();               
				if(line == null)
                   eof = true;
				else 
				{
					if(line.trim().equals("EXPENSE_TYPE")) 
					{
						line = buff.readLine();  
						if(line.trim().equals("{"))
						{
							// Thetoume arxikes times.
							type = code = -1;
							descr = "";
							max_fee = 200; 
							unit_fee = 1;
							rate = 0.1;
							unit_text = "No unit text";
							
							while(!(line.trim().equals("}")) && (!eof)) // Diavazoume apo to arxeio tis plirofories gia EXPENSE_TYPE mexri na synantisoume to 
							// } symfvna me to Pararthma.
							{
								line = buff.readLine();
								if(line == null)
								   eof = true;

								if(line.trim().equals("")) // An einai kenh grammh thn agnooume.
									continue;
								
								lineTokens = new StringTokenizer(line);
								token = lineTokens.nextToken();
								if(token.toUpperCase().equals("TYPE")) // Prvta kanoume thn lexi kefalaia kai meta sigkrinoume.
								{
									token = lineTokens.nextToken();
									type = Integer.parseInt(token);
								}
								else if(token.toUpperCase().equals("CODE")) 
								{
									token = lineTokens.nextToken();
									code = Integer.parseInt(token);
								}
								else if(token.toUpperCase().equals("DESCR"))
								{
									token = lineTokens.nextToken(); 
									descr = token;
								}
								else if(token.toUpperCase().equals("MAX_FEE")) 
								{
									token = lineTokens.nextToken();
									max_fee = Double.parseDouble(token);
								}
								else if(token.toUpperCase().equals("UNIT_FEE")) 
								{
									token = lineTokens.nextToken();
									unit_fee = Double.parseDouble(token);
								}
								else if(token.toUpperCase().equals("UNIT_TEXT")) 
								{
									token = lineTokens.nextToken();
									unit_text = token;					
								}								
								else if(token.toUpperCase().equals("RATE")) 
								{
									token = lineTokens.nextToken();
									rate = Double.parseDouble(token);
								}
							}
							if(type == -1 || code == -1 || descr.equals(""))
							{
								if(type == -1)
									System.out.println("\nError_Expense_File: Type tag does not exist");
								if(code == -1)
									System.out.println("\nError_Expense_File: Code tag does not exist");
								if(descr.equals(""))
									System.out.println("\nError_Expense_File: Description tag does not exist");
							}
							else // Dhmiourgia antikeimenou typou dapanhs kai apothikeushs ston pinaka vec_exp_type.
							{
								if(type == 1)
									vec_exp_type.add(new Expense_Type_1(code, descr, max_fee, unit_fee, unit_text)); 
								else if(type == 2)
									vec_exp_type.add(new Expense_Type_2(code, descr, max_fee, rate)); 
								else
									System.out.println("\nError_Expense_File: Wrong type");
							}
						}    
					}
				}
			}
			buff.close(); // Kleinoume to arxeio.
		}
		catch(IOException e)
		{
			System.out.println("\nFile error: " + e.toString());
		}
	}
	static void read_emp(Vector<Employee> vec_emp)
	{
		try
		{
			boolean eof;
			int code;
			double max_month_fee;
			StringTokenizer lineTokens;
			String line, token, surname, firstname;

			FileReader fr = new FileReader("employee_list.txt"); // Anoigoume to arxeio gia na diavasoume apo auto, symfvna me to Pararthma.
			BufferedReader buff = new BufferedReader(fr);
			eof = false;
			while(eof == false)
			{
				line = buff.readLine();               
				if(line == null)
                   eof = true;
				else 
				{
					if(line.trim().equals("EMPLOYEE")) 
					{
						line = buff.readLine();  
						if(line.trim().equals("{"))
						{
							// Thetoume arxikes times.
							code = -1;
							surname = firstname = "";
							max_month_fee = 300; 
							
							while(!(line.trim().equals("}")) && (!eof)) // Diavazoume apo to arxeio tis plirofories gia EMPLOYEE mexri na synantisoume to 
							// } symfvna me to Pararthma.
							{
								line = buff.readLine();
								if(line == null)
								   eof = true;

								if(line.trim().equals("")) // An einai kenh grammh thn agnooume.
									continue;

								lineTokens = new StringTokenizer(line);
								token = lineTokens.nextToken();  
								if(token.toUpperCase().equals("CODE")) 
								{
									token = lineTokens.nextToken(); 
									code = Integer.parseInt(token);
								}
								else if(token.toUpperCase().equals("SURNAME")) 
								{
									token = lineTokens.nextToken(); 
									surname = token;
								}
								else if(token.toUpperCase().equals("FIRSTNAME")) 
								{
									token = lineTokens.nextToken();
									firstname = token;
								}
								else if(token.toUpperCase().equals("MAX_MONTHLY_VAL")) 
								{
									token = lineTokens.nextToken();
									max_month_fee = Double.parseDouble(token);									
								}
							}
							if(code == -1 || surname.equals("") || firstname.equals(""))
							{
								if(code == -1)
									System.out.println("\nError_Employee_File: Code tag does not exist");
								if(surname.equals(""))
									System.out.println("\nError_Employee_File: Surname tag does not exist");
								if(firstname.equals(""))
									System.out.println("\nError_Employee_File: Firstname tag does not exist");
							}
							else // Dhmiourgia antikeimenou kai apothikeushs ston pinaka vec_emp.
							{
								vec_emp.add(new Employee(code, surname, firstname, max_month_fee)); 
							}
						}    
					}
				}
			}
			buff.close(); // Kleinoume to arxeio.			
		}
		catch(IOException e)
		{
			System.out.println("\nFile error: " + e.toString());
		}
	}
	static void read_exp_emp(Vector<Employee> vec_emp, Vector<Expense_Type> vec_exp_type, Vector<Expense_Employee> vec_exp_emp)
	{
		try
		{
			boolean eof, found;
			int i, emp_code, exp_type, exp_code;
			double val;
			StringTokenizer lineTokens;
			String line, token, cause;

			FileReader fr = new FileReader("expense_employee.txt"); // Anoigoume to arxeio gia na diavasoume apo auto, symfvna me to Pararthma.
			BufferedReader buff = new BufferedReader(fr);
			eof = false;
			while(eof == false)
			{
				line = buff.readLine();               
				if(line == null)
                   eof = true;
				else 
				{
					if(line.trim().equals("EXPENSE")) 
					{
						line = buff.readLine();  
						if(line.trim().equals("{"))
						{
							// Thetoume arxikes times.
							emp_code = exp_type = exp_code = -1;
							val = -1;
							cause = ""; 
							
							while(!(line.trim().equals("}")) && (!eof)) // Diavazoume apo to arxeio tis plirofories gia kathe dapanh EXPENSE pou 
							// ekane o ypallhlos mexri na synantisoume to } symfvna me to Pararthma.
							{
								line = buff.readLine();
								if(line == null)
								   eof = true;

								if(line.trim().equals("")) // An einai kenh grammh thn agnooume.
									continue;

								lineTokens = new StringTokenizer(line);
								token = lineTokens.nextToken();  
								if(token.toUpperCase().equals("EMPLOYEE_CODE")) 
								{
									token = lineTokens.nextToken(); 
									emp_code = Integer.parseInt(token);
								}
								else if(token.toUpperCase().equals("EXPENSE_TYPE")) 
								{
									token = lineTokens.nextToken(); 
									exp_type = Integer.parseInt(token);
								}
								else if(token.toUpperCase().equals("EXPENSE_CODE")) 
								{
									token = lineTokens.nextToken(); 
									exp_code = Integer.parseInt(token);
								}
								else if(token.toUpperCase().equals("VAL")) 
								{
									token = lineTokens.nextToken();
									val = Double.parseDouble(token);									
								}
								else if(token.toUpperCase().equals("CAUSE")) 
								{
									token = lineTokens.nextToken(); 
									cause = token;
								}
							}
							if(emp_code == -1 || exp_type == -1 || exp_code == -1 || val == -1)
							{
								if(emp_code == -1)
									System.out.println("\nError_Expense_Employee_File: Emp_code tag does not exist");
								if(exp_type == -1)
									System.out.println("\nError_Expense_Employee_File: Exp_type tag does not exist");
								if(exp_code == -1)
									System.out.println("\nError_Expense_Employee_File: Exp_code tag does not exist");
								if(val == -1)
									System.out.println("\nError_Expense_Employee_File: Val tag does not exist");
							}
							else
							{
								// Elegxoume an o kodikos ths dapanhs yparxei sto vec_exp_type, gia na doume oti einai egkiros.
								found = false;
								for(i = 0; i < vec_exp_type.size(); i++)
								{
									Expense_Type exp = vec_exp_type.get(i);
									if(exp.code == exp_code)
									{
										found = true;
										break;
									}
								}
								if(found == false)
									System.out.println("\nError_Expense_Employee_File: Expense with code " + exp_code + " does not exist");
								else // An o kodikos ths dapanhs einai egkiros, tvra elegxoume an o kodikos tou ypallhloy yparxei sto vec_emp, 
								// gia na doume oti einai egkiros.
								{
									found = false;
									for(i = 0; i < vec_emp.size(); i++)
									{
										Employee emp = vec_emp.get(i);
										if(emp.code == emp_code)
										{
											found = true;
											// Dhmiourgia antikeimenou dapanhs_ergazomenou kai apothikeushs ston pinaka vec_exp_emp.
											vec_exp_emp.add(new Expense_Employee(emp, exp_type, exp_code, val, cause)); 
											break;
										}
									}
									if(found == false)
										System.out.println("\nError_Expense_Employee_File: Employee with code " + emp_code + " does not exist");
								}
							}
						}    
					}
				}
			}
			buff.close(); // Kleinoume to arxeio.
		}
		catch(IOException e)
		{
			System.out.println("\nFile error: " + e.toString());
		}
	}
	static void read_fee_emp(Vector<Employee> vec_emp, Vector<Expense_Type> vec_exp_type, Vector<Fee_Employee> vec_fee_emp)
	{
		try
		{
			boolean eof, found;
			int i, emp_code, exp_type, exp_code;
			double val;
			StringTokenizer lineTokens;
			String line, token, type;
			Employee emp = new Employee();
							
			FileReader fr = new FileReader("fee_employee.txt"); // Anoigoume to arxeio gia na diavasoume apo auto, symfvna me to Pararthma.
			BufferedReader buff = new BufferedReader(fr);
			eof = false;
			while(eof == false)
			{
				line = buff.readLine();               
				if(line == null)
                   eof = true;
				else 
				{
					if(line.trim().equals("TRN")) 
					{
						line = buff.readLine();  
						if(line.trim().equals("{"))
						{
							type = "";
							emp_code = exp_type = exp_code = -1;
							val = -1;
							
							while(!(line.trim().equals("}")) && (!eof)) // Diavazoume apo to arxeio tis plirofories gia kathe kinhsh TRN pou 
							// ekane o ypallhlos mexri na synantisoume to } symfvna me to Pararthma.
							{
								line = buff.readLine();
								if(line == null)
								   eof = true;

								if(line.trim().equals("")) // An einai kenh grammh thn agnooume.
									continue;

								lineTokens = new StringTokenizer(line);
								token = lineTokens.nextToken();  
								if(token.toUpperCase().equals("EMPLOYEE_CODE")) 
								{
									token = lineTokens.nextToken(); 
									emp_code = Integer.parseInt(token);
								}
								else if(token.toUpperCase().equals("TYPE")) 
								{
									token = lineTokens.nextToken(); 
									type = token;
								}
								else if(token.toUpperCase().equals("VAL")) 
								{
									token = lineTokens.nextToken();
									val = Double.parseDouble(token);
								}
								else if(token.toUpperCase().equals("EXPENSE_TYPE")) 
								{
									token = lineTokens.nextToken(); 
									exp_type = Integer.parseInt(token);
								}
								else if(token.toUpperCase().equals("EXPENSE_CODE")) 
								{
									token = lineTokens.nextToken(); 
									exp_code = Integer.parseInt(token);
								}
							}
							if(emp_code == -1 || type.equals(""))
							{
								if(emp_code == -1)
									System.out.println("\nError_Fee_Employee_File: Emp_code tag does not exist");
								if(type.equals(""))
									System.out.println("\nError_Fee_Employee_File: Type tag does not exist");
							}
							else
							{
								// Elegxoume an o kodikos tou ypallhloy yparxei sto vec_emp, gia na doume oti einai egkiros.
								found = false;
								for(i = 0; i < vec_emp.size(); i++)
								{
									emp = vec_emp.get(i);
									if(emp.code == emp_code)
									{
										found = true;
										break;
									}
								}
								if(found == false)
									System.out.println("\nError_Fee_Employee_File: Employee with code " + emp_code + " does not exist");
								else
								{
									if(type.equals("\"APOZIMIOSI\""))
									{
										if(exp_type != 1 && exp_type != 2) // Elegxoume oti o typos ths dapanhs einai egkiros.
											System.out.println("\nError_Fee_Employee_File: Exp_type " + exp_type + " does not exist");
										else
										{
											// Elegxoume an o kodikos ths dapanhs yparxei sto vec_exp_type, gia na doume oti einai egkiros.
											found = false;
											for(i = 0; i < vec_exp_type.size(); i++)
											{
												Expense_Type exp = vec_exp_type.get(i);
												if(exp.code == exp_code)
												{

													found = true;
													emp.update_sum_fee(val);
													// Dhmiourgoume ena Fee_Employee antikeimeno me ta stoixeia ths dapanhs kai thn apozimiosh 
													// gia ton ypallhlo emp kai to vazoume ston pinaka.
													vec_fee_emp.add(new Fee_Employee(emp, exp_type, exp_code, exp.descr, val));
													emp.set_clear(true);
													break;
												}
											}
											if(found == false)
												System.out.println("\nError_Fee_Employee_File: Expense with code " + exp_code + " does not exist");
										}
									}
									else if(type.equals("\"PROKATAVOLI\""))
										emp.set_advance(val);
									else if(type.equals("\"DIAFORA\""))
										emp.set_credit(val);
									else if(type.equals("\"FINAL_APOZIMIOSI\""))
										emp.set_month_fee(val);
								}
							}
						}    
					}
				}
			}
			buff.close(); // Kleinoume to arxeio.
		}
		catch(IOException e)
		{
			System.out.println("\nFile error: " + e.toString());
		}
	}
}
