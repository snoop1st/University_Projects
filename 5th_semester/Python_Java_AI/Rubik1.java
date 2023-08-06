import java.util.ArrayList;
import java.util.Collections;


public class Rubik1 implements Comparable<Rubik1>
{
	public static int[][][] cube;
	public static int[][][] initial_cube;
	public static int[][][] first_cube;
	public static ArrayList<Rubik1> frontier;
	public int score;
	public Rubik1 father;

	Rubik1()
	{
		father = null;
		frontier = new ArrayList<>();
	}
	
	public static int[][][] rubik_copy(int[][][] cube) //thn xrhsimopoioyme gia na dhmioyrghsoyme ena antigrafo to kyvou.
	{
		int i, j, k;		
		int[][][] cube_copy = new int[6][3][3];

		for(i = 0; i < 6; i++)
			for(j = 0; j < 3; j++)
				for(k = 0; k < 3; k++)
					cube_copy[i][j][k] = cube[i][j][k];

		return cube_copy;
	}
	
	public static void reverse_leftside(int side)
	{
		int cube_copy[][][] = rubik_copy(cube);
		
		cube[side][0][0] = cube_copy[side][0][2]; //oysiastika ta stoixeia twn pleyrwn ephreazontai me kapoies peristrofes, oi sthles toys ginontai grammes kai oi grammes sthles.
		cube[side][0][1] = cube_copy[side][1][2]; 
		cube[side][0][2] = cube_copy[side][2][2];
		cube[side][1][0] = cube_copy[side][0][1];
		cube[side][1][1] = cube_copy[side][1][1];
		cube[side][1][2] = cube_copy[side][2][1];
		cube[side][2][0] = cube_copy[side][0][0];
		cube[side][2][1] = cube_copy[side][1][0];
		cube[side][2][2] = cube_copy[side][2][0];	
	}
	
	public static void reverse_rightside(int side)
	{
		int cube_copy[][][] = rubik_copy(cube);

		cube[side][0][0] = cube_copy[side][2][0]; 
		cube[side][0][1] = cube_copy[side][1][0];
		cube[side][0][2] = cube_copy[side][0][0];
		cube[side][1][0] = cube_copy[side][2][1];
		cube[side][1][1] = cube_copy[side][1][1];
		cube[side][1][2] = cube_copy[side][0][1];
		cube[side][2][0] = cube_copy[side][2][2];
		cube[side][2][1] = cube_copy[side][1][2];
		cube[side][2][2] = cube_copy[side][0][2];	
	}
	
	public static void move_up(int column) //h kinhsh pros ta panw
	{
		int i;		
		int cube_copy[][][] = rubik_copy(cube);

		if(column == 0)
		{
			for(i = 0; i < 3; i++)
			{
				cube[3][i][column] = cube_copy[0][i][column];
				cube[2][i][column + 2] = cube_copy[3][2-i][column]; //bazoyme i-2 kathws to stoixeio [2][0][2] ginetai [3][2][0]
				cube[5][i][column] = cube_copy[2][2-i][column + 2];
				cube[0][i][column] = cube_copy[5][i][column];
			}
			reverse_leftside(4);
		}
		else if(column == 2)
		{
			for(i = 0; i < 3; i++)
			{
				cube[3][i][column] = cube_copy[0][i][column];
				cube[2][i][column - 2] = cube_copy[3][2-i][column]; //bazoyme i-2 kathws to stoixeio [2][0][2] ginetai [3][2][0]
				cube[5][i][column] = cube_copy[2][2-i][column - 2];
				cube[0][i][column] = cube_copy[5][i][column];
			}
			reverse_rightside(1);
		}
		else
		{
			for(i = 0; i < 3; i++)
			{
				cube[3][i][column] = cube_copy[0][i][column];
				cube[2][i][column] = cube_copy[3][i][column]; 
				cube[5][i][column] = cube_copy[2][i][column];
				cube[0][i][column] = cube_copy[5][i][column];
			}
		}
	} 
		
	public static void move_down(int column) //h kinhsh pros ta katw. Oysiastika einai treis fores h kinhsh pros ta panw.
	{
		for(int i = 0; i < 3; i++)
			move_up(column);
	}
	
	public static void move_right(int row) //peristrofh symfwna me toys deiktes toy rologioy 
	{
		int i;		
		int cube_copy[][][] = rubik_copy(cube);

		for(i = 0; i < 3; i++)
		{
			cube[0][row][i] = cube_copy[1][row][i];
			cube[4][row][i] = cube_copy[0][row][i];
			cube[2][row][i] = cube_copy[4][row][i];
			cube[1][row][i] = cube_copy[2][row][i];
		}
		if(row == 0)
			reverse_rightside(3);
		else if(row == 2)
			reverse_leftside(5);
	}
	
	public static void move_left(int row) //antistrofa apo thn fora toy rologioy
	{
		for(int i = 0; i < 3; i++)
			move_right(row);
	}
	
	public static void move_side_right(int column) // h pleyrikh kinhsh. symfwna me toys deiktes toy rologioy 
	{
		int i;		
		int cube_copy[][][] = rubik_copy(cube);

		if(column == 0)
		{
			for(i = 0; i < 3; i++)
			{
				cube[3][2][i] = cube_copy[4][2-i][2];
				cube[1][i][0] = cube_copy[3][2][i];
				cube[4][i][2] = cube_copy[5][0][i];
				cube[5][0][i] = cube_copy[1][2-i][0];
			}
			reverse_rightside(0);
		}
		else if(column == 2)
		{
			for(i = 0; i < 3; i++)
			{
				cube[3][0][i] = cube_copy[4][2-i][0];
				cube[1][i][2] = cube_copy[3][0][i];
				cube[4][i][0] = cube_copy[5][2][i];
				cube[5][2][i] = cube_copy[1][2-i][2];
			}
			reverse_leftside(2);
		}
		else 
		{
			for(i = 0; i < 3; i++)
			{
				cube[3][1][i] = cube_copy[4][2][1];
				cube[1][i][1] = cube_copy[3][1][i];
				cube[4][i][1] = cube_copy[5][1][i];
				cube[5][1][i] = cube_copy[1][2][1];
			}
		}
	}

	public static void move_side_left(int column) // antitheta apo toys deiktes toy rologioy.
	{
		for(int i = 0; i < 3; i++)
			move_side_right(column);
	}
	
	Rubik1 getFather()
	{
        return this.father;
    }

    public void setFather(Rubik1 father)
	{
        this.father = father;
    }
	
	public ArrayList<Rubik1> getChildren() //dhmioyrgoyme mia lista poy tha periexei ta paidia. Gia kathe kinhsh dhmioyrgoyme ena paidi.
    {
        ArrayList<Rubik1> children = new ArrayList<>(); //dhmioyrgoyme lista me ta paidia
		first_cube = rubik_copy(cube);
		
		Rubik1 child1 = new Rubik1(); //to prwto paidi ths kinhshs move_up
		child1.cube = rubik_copy(cube); //dhmioyrgw antigrafo toy cube poy ginetai iso me to child1.cube
		child1.move_up(0);
		child1.score = child1.countOffPlace();
		child1.setFather(this);
//		child1.print_cube();
//		System.out.println("-----------------------------------------------------");
		children.add(child1); 
		
		cube = rubik_copy(first_cube);
		Rubik1 child2 = new Rubik1();
		child2.cube = rubik_copy(child1.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child2.move_up(1);
		child2.score = child2.countOffPlace();
		child2.setFather(this);
//		System.out.println("-----------------------------------------------------");
//		child2.print_cube();
		children.add(child2);
		
		cube = rubik_copy(first_cube);
		Rubik1 child3 = new Rubik1();
		child3.cube = rubik_copy(child2.cube);
		child3.move_up(2);
		child3.score = child3.countOffPlace();
		child3.setFather(this);		
//		System.out.println("-----------------------------------------------------");
		children.add(child3);
	
		cube = rubik_copy(first_cube);
		Rubik1 child4 = new Rubik1();
		child4.cube = rubik_copy(child3.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child4.move_down(0);
		child4.score = child4.countOffPlace();
		child4.setFather(this);		
//		child4.print_cube();
//		System.out.println("-----------------------------------------------------");
		children.add(child4);
		
		cube = rubik_copy(first_cube);
		Rubik1 child5 = new Rubik1();
		child5.cube = rubik_copy(child4.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child5.move_down(1);
		child5.score = child5.countOffPlace();
		child5.setFather(this);				
//		System.out.println("-----------------------------------------------------");
		children.add(child5);
		
		cube = rubik_copy(first_cube);
		Rubik1 child6 = new Rubik1();
		child6.cube = rubik_copy(child5.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child6.move_down(2);
		child6.score = child6.countOffPlace();
		child6.setFather(this);				
//		System.out.println("-----------------------------------------------------");
		children.add(child6);
		
		cube = rubik_copy(first_cube);
		Rubik1 child7 = new Rubik1();
		child7.cube = rubik_copy(child6.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child7.move_right(0);
		child7.score = child7.countOffPlace();
		child7.setFather(this);				
//		System.out.println("-----------------------------------------------------");
		children.add(child7);
		
		cube = rubik_copy(first_cube);
		Rubik1 child8 = new Rubik1();
		child8.cube = rubik_copy(child7.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child8.move_right(1);
		child8.score = child8.countOffPlace();
		child8.setFather(this);				
//		System.out.println("-----------------------------------------------------");
		children.add(child8);
		
		cube = rubik_copy(first_cube);
		Rubik1 child9 = new Rubik1();
		child9.cube = rubik_copy(child8.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child9.move_right(2);
		child9.score = child9.countOffPlace();
		child9.setFather(this);				
//		System.out.println("-----------------------------------------------------");
		children.add(child9);
		
		cube = rubik_copy(first_cube);
		Rubik1 child10 = new Rubik1();
		child10.cube = rubik_copy(child9.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child10.move_left(0);
		child10.score = child10.countOffPlace();
		child10.setFather(this);				
//		System.out.println("-----------------------------------------------------");
		children.add(child10);
		
		cube = rubik_copy(first_cube);
		Rubik1 child11 = new Rubik1();
		child11.cube = rubik_copy(child10.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child11.move_left(1);
		child11.score = child11.countOffPlace();
		child11.setFather(this);				
//		System.out.println("-----------------------------------------------------");
		children.add(child11);
		
		cube = rubik_copy(first_cube);
		Rubik1 child12 = new Rubik1();
		child12.cube = rubik_copy(child11.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child12.move_left(2);
		child12.score = child12.countOffPlace();
		child12.setFather(this);				
//		System.out.println("-----------------------------------------------------");
		children.add(child12);
		
		cube = rubik_copy(first_cube);
		Rubik1 child13 = new Rubik1();
		child13.cube = rubik_copy(child12.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child13.move_side_right(0);
		child13.score = child13.countOffPlace();
		child13.setFather(this);				
//		System.out.println("-----------------------------------------------------");
		children.add(child13);
		
		cube = rubik_copy(first_cube);
		Rubik1 child14 = new Rubik1();
		child14.cube = rubik_copy(child13.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child14.move_side_right(1);
		child14.score = child14.countOffPlace();
		child14.setFather(this);				
	//	System.out.println("-----------------------------------------------------");
		children.add(child14);
		
		cube = rubik_copy(first_cube);
		Rubik1 child15 = new Rubik1();
		child15.cube = rubik_copy(child14.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child15.move_side_right(2);
		child15.score = child15.countOffPlace();
		child15.setFather(this);						
//		System.out.println("-----------------------------------------------------");
		children.add(child15);
		
		cube = rubik_copy(first_cube);
		Rubik1 child16 = new Rubik1();
		child16.cube = rubik_copy(child15.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child16.move_side_right(0);
		child16.score = child16.countOffPlace();
		child16.setFather(this);						
//		System.out.println("-----------------------------------------------------");
		children.add(child16);
		
		cube = rubik_copy(first_cube);
		Rubik1 child17 = new Rubik1();
		child17.cube = rubik_copy(child16.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child17.move_side_right(0);
		child17.score = child17.countOffPlace();
		child17.setFather(this);				
//		System.out.println("-----------------------------------------------------");
		children.add(child17);
		
		cube = rubik_copy(first_cube);
		Rubik1 child18 = new Rubik1();
		child18.cube = rubik_copy(child17.cube); //prin kanw allh kinhsh dhmioyrgw antigrafo ths prohgoymenhs 
		child18.move_side_right(0);
		child18.score = child18.countOffPlace();
		child18.setFather(this);						
//		System.out.println("-----------------------------------------------------");
		children.add(child18);	
		
		return children;
	}
	
/*
Xrhsimopoioyme ws eyretikh posa kybakia einai ektos theshs. Orizoyme pws sthn panw pleyra einai aspro kai sthn katw pleyra einai to prasino. 
Metrame dhladh posa aspra kyvakia leipoyn gia na lythei h pleyra.								
*/
	public static int countOffPlace() 
	{
		int i, j, count;

		count = 0;
		for(i = 0; i < 3; i ++)
			for(j = 0; j < 3; j++)
			{
				if(cube[3][i][j] > 8)
					count++;	
				if(cube[5][i][j] < 45)
					count++;
			}
//		System.out.println(count);
		return count;
	}
	
	public static boolean isFinal(Rubik1 cube_state) //synarthsh gia na elegxoyme an einai se telikh katastash. Thewroyme ws telikh katastash thn pleyra 3(apo panw) asprhkai thn pleyra 5(apo katw) prasinh.
	{
		int i, j;

		for(i = 0; i < 3; i++)
			for(j = 0; j < 3; j++)
			{
				if(cube_state.cube[3][i][j] > 8 || cube_state.cube[5][i][j] < 46)
					return false;
			}
		return true;
	}
	//A STAR
	
	public static Rubik1 a_star(Rubik1 initial_cube)
	{
		ArrayList<Rubik1> list = new ArrayList<Rubik1>(); //dhmiorygoyme mia lista antikeimenwn typou rubik1 
		if(isFinal(initial_cube))
			return initial_cube;

		frontier.add(initial_cube); //eisagoyme ton arxiko kyvo sthn lista
		while(frontier.size() > 0)
		{
			Rubik1 current_cube = frontier.remove(0); //kathe fora tha afairei ayton me to mikrotero score
//			System.out.println(current_cube.score);
			if(isFinal(current_cube)) //elegxoyme an einai se telikh katastash
				return current_cube;
			list = current_cube.getChildren();
			frontier.addAll(list); //prosthetoyme ola ta paidia ths getchildren sthn lista frontier
			Collections.sort(frontier); //bazoyme ayto me to mikrotero kostos sthn arxh
			System.out.println(frontier);
		}
		return null;	
	}
	
	@Override
    public int compareTo(Rubik1 r)
    {
        return Integer.compare(this.score, r.score); // sygkrinoyme ta score me bash thn eyretikh
    }
	
	public static void print_cube() //synarthsh gia na ektypwnoyme ton kyvo.
	{
		int i, j, k;
		
		for(i = 0; i < 6; i++)
		{
			for(j = 0; j < 3; j++)
			{
				for(k = 0; k < 3; k++)
				{
					if(0 <= cube[i][j][k] && cube[i][j][k] < 9) //ana 9 allazoyme xrwma 
						System.out.print("w" + "\t");
					else if(cube[i][j][k] < 18)
						System.out.print("b" + "\t");
					else if(cube[i][j][k] < 27)
						System.out.print("r" + "\t");
					else if(cube[i][j][k] < 36)
						System.out.print("o" + "\t");
					else if(cube[i][j][k] < 45)
						System.out.print("y" + "\t");
					else 
						System.out.print("g" + "\t");
				//	System.out.print(cube[i][j][k] + "\t");
				}
				System.out.println();
			}
			System.out.println();
		}
	}
	public static void main(String[] args)
	{
		int i, j, k, list_counter, sides_to_solve;
		
		sides_to_solve = Integer.parseInt(args[0]);
		cube = new int[6][3][3]; 
		Rubik1 initial_cube = new Rubik1();
		
		ArrayList<Integer> list = new ArrayList<Integer>(); //ftiaxnoyme mia lista apo 54 akeraioys me tyxaia seira
		for (i = 0; i < 54; i++)
			list.add(i);
		Collections.shuffle(list); //anakateyoyme thn lista
			
		list_counter = 0;
		for(i = 0; i < 6; i++)
		{
			for(j = 0; j < 3; j++)
			{
				for(k = 0; k < 3; k++)
				{
					cube[i][j][k] = list.get(list_counter); //apothikeyoyme ta stoixeia ths listas ston pinaka cube
					list_counter++;
				}
			}
		}
		initial_cube.cube = rubik_copy(cube); //kratame ena antigrafo toy kyvoy prin ton epexergastoyme 
		print_cube();
		System.out.println("-----------------------------------------------------");
		Rubik1 terminalCube = a_star(initial_cube);
		if(terminalCube == null)
			System.out.println("Problem not solved.");
		else
		{
            Rubik1 tmp = terminalCube; 
            ArrayList<Rubik1> path = new ArrayList<>();
			path.add(terminalCube);

            while(tmp.getFather() != null) 
            {
                path.add(tmp.getFather());
                tmp = tmp.getFather();
            }
            Collections.reverse(path);
            for(Rubik1 item: path)
            {
                item.print_cube();
            }
		}
//		print_cube();
	}
}
