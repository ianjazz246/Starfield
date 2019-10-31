Particle test;

ArrayList<Particle> particleList;

float particleCenterDist = 5;
float numParticles = 80;

//your code here
void setup()
{
	//your code here
	size(500, 500);

	particleList = new ArrayList<Particle>();

	for (int i = 0; i < numParticles; i++)
	{
		double rotatePerIterate = 2*Math.PI/numParticles;
		particleList.add(
			new Particle(
				(float)(particleCenterDist*Math.cos(rotatePerIterate*i) + width/2), (float)(particleCenterDist*Math.sin(rotatePerIterate*i) + height/2),
				(float)(rotatePerIterate*i),
				(float)(Math.random()*21),
				color((int)(Math.random()*80)+175),
				5
			)
		);
	}

	particleList.add(
		new OddballParticle(
			width/2, height/22,
			(float)(Math.random()*2*Math.PI),
			(float)(Math.random()*4),
			color((int)(Math.random()*80)+80),
			50
		)
	);
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
	}
}

class Particle
{
	//your code here
	float x, y;
	float angle, speed;
	float prevX, prevY;

	int clr, size;

	Particle(float x, float y, float angle, float speed, int clr, int size)
	{
		this.x = x;
		this.y = y;
		this.angle = angle;
		this.speed = speed;

		this.clr = clr;
		this.size = size;
	}

	void move()
	{
		this.prevX = this.x;
		this.prevY = this.y;

		//float xComp = this.speed * Math.cos(angle);


		this.x += this.speed * Math.cos(angle);
		this.y += this.speed * Math.sin(angle);

		if (this.x > width || this.x < 0 || this.y > height || this.y < 0)
		{
			this.reset();
		}
	}

	void show()
	{
		//behind screen
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
		this.angle = (float)(Math.random()*2*Math.PI);

		this.x = (float)(particleCenterDist*Math.cos(angle) + width/2);
		this.y = (float)(particleCenterDist*Math.sin(angle) + height/2);

		this.prevX = this.x;
		this.prevY = this.y;
	}

}

class OddballParticle extends Particle
{
	float rotation;
	OddballParticle(float x, float y, float angle, float speed, int clr, int size)
	{
		super(x, y, angle, speed, clr, size);
		this.rotation = 0;
	}

	void move()
	{
		this.rotation += Math.PI / 50;
		super.move();
	}

	void show()
	{
		pushMatrix();
		fill(this.clr);
		stroke(this.clr - 20);
		translate(this.x, this.y);
		rotate((float)(this.rotation));
		scale(2);
		//translate back to original position
		translate(-this.x, -this.y);
		ellipse(this.x, this.y, 10, 4);
		ellipse(this.x, this.y, 10, 2);
		ellipse(this.x - 10, this.y - 3, 4, 10);


		popMatrix();
	}

}


