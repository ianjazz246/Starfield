Particle test;

ArrayList<Particle> particleList;

//your code here
void setup()
{
	//your code here
	size(500, 500);

	particleList = new ArrayList<Particle>();

	for (int i = 0; i < 80; i++)
	{
		particleList.add(
			new Particle(
				width/2.f, height/2.f, 50.f,
				(float)(Math.random()*3-1), (float)(Math.random()*3-1), 0.f,
				color(255),
				5
			)
		);
	}
}
void draw()
{
	//your code here
	background(0);
	for (int i = 0; i < particleList.size(); i++)
	{
		Particle particle = particleList.get(i);
		particle.move();
		particle.show();

		if (particle.x > width || particle.x < 0 || particle.y > height || particle.y < 0)
		{
			particle.reset();
		}
	}
}
class Particle
{
	//your code here
	float x, y, z;
	float xVel, yVel, zVel;
	float prevX, prevY, prevZ;

	int clr, size;

	Particle(float x, float y, float z, float xVel, float yVel, float zVel, int clr, int size)
	{
		this.x = x;
		this.y = y;
		this.z = z;
		this.xVel = xVel;
		this.yVel = yVel;
		this.zVel = zVel;

		this.clr = clr;
		this.size = size;
	}

	void move()
	{
		this.prevX = this.x;
		this.prevY = this.y;
		this.prevZ = this.z;

		this.x += this.xVel;
		this.y += this.yVel;
		this.z += this.zVel; 
		//System.out.println(this.z);
	}

	void show()
	{
		//behind screen
		if (this.z < 0) {
			return;
		}
		// double pitch = Math.atan(this.y / (height / 2));
		fill(this.clr);
		// float distFromCenter = dist(this.x, this.y, width / 2, height / 2);
		//ellipse((this.x - width / 2) / this.z + this.x, (this.y - height / 2) / this.z + this.y, (this.size * distFromCenter / 5) / this.z, (this.size * distFromCenter / 5) / this.z);
		//System.out.println(this.x - width/2);

		//ellipse(this.x, this.y, this.size, this.size);
		stroke(this.clr);
		strokeWeight(this.size);
		line(this.x, this.y, this.prevX, this.prevY);
	}

	void reset()
	{
		this.x = width / 2;
		this.y = height / 2;

		this.xVel = (float)(Math.random() * 3) - 1;
		this.yVel = (float)(Math.random() * 3) - 1;
	}

}

class OddballParticle //inherits from Particle
{
	//your code here
}


