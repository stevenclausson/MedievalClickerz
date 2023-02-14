extends Node

var rng = RandomNumberGenerator.new()


var day = 0


var population = 10
var unemployed = 0 
var populationGrowthRate = 0.008

var food = 100
var water = 300

var timber = 10
var timberGrowthRate = 0
var stone = 10
var hide = 20

var simpleHut = 0
var timberCamp = 0
var stoneCamp = 0







#----FUNCTIONS HERE

func Forage():
	rng.randomize()
	timber += rng.randf_range(1,4)
	food += population * 0.01 + rng.randf_range(0,10)
	water += population * 0.01 + rng.randf_range(0,10)

func PopulationAppetite():
	food -= population * 3
	water -= population * 4

func PopulationGrowth():
	if (population >= 2):
		population += populationGrowthRate
		print("Population grew to " + str(population))
	else:
		pass

func BuildTimberCamp():
	if(unemployed >= 1) and (timber >= 2) and (stone >= 2):
		timberCamp +=1
		timberGrowthRate += 1
		





func ResourceCollection():
	timber += timberGrowthRate
func CheckEmployment():
	unemployed = population - (timberCamp + stoneCamp)
#UI STUFF

