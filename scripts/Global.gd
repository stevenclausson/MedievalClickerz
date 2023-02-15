extends Node

var rng = RandomNumberGenerator.new()


var day = 0
var year = 0

var population = 10
var unemployed = 0 
var populationGrowthRate = 0.008

var food = 100
var foodCollectionRate = 0
var isStarving = false
var starvingDays = 0

var water = 300
var waterCollectionRate = 0

var timber = 10
var timberGrowthRate = 0
var stone = 10
var stoneCollectionRate = 0
var hide = 20

var smallHouse = 0
var largeHouse = 0
var familyFarm = 0
var timberCamp = 0
var stoneQuarry = 0
var primitiveWell = 0






#----FUNCTIONS HERE

func Forage():
	rng.randomize()
	timber += rng.randf_range(0,1)
	stone += rng.randf_range(0,2)
	food += population * 0.01 + rng.randf_range(0,5)
	water += population * 0.01 + rng.randf_range(0,5)

func PopulationAppetite():
	food -= population * 3
	water -= population * 4
	if (food <=0 ):
		food = 0
		isStarving = true
		starvingDays += 1
		print("Your people are starving my lord.")
	else:
		isStarving = false
	if (water <= 0):
		water == 0

func PopulationGrowth():
	if (population >= 2):
		population += populationGrowthRate
	else:
		pass

#----------------------------------------
# ------ BUILDING FUNCTIONS
#---------------------------------------
func BuildTimberCamp():
	if(unemployed >= 1) and (timber >= 65) and (stone >= 65):
		timberCamp +=1
		timberGrowthRate += 1
		timber -= 65
		stone -= 65

func BuildStoneQuarry():
	if(timber >= 40) and (unemployed >= 1):
		stoneQuarry += 1
		stoneCollectionRate += 2
		timber -= 40

func BuildPrimitiveWell():
	if(timber >= 45) and (stone >= 100):
		primitiveWell += 1
		waterCollectionRate += 10
		timber -= 45
		stone -= 100

func BuildSmallHouse():
	if (smallHouse <= population):
		if (timber >= 225) and (stone >= 120):
			smallHouse += 1
			populationGrowthRate += 0.002
			timber -= 225
			stone -= 120
		else:
			pass
	else:
		pass

func BuildFamilyFarm():
	if(familyFarm <= population):
		if(timber >= 100) and (stone >= 75):
			familyFarm += 1
			foodCollectionRate += 10
			timber -= 100
			stone -= 75
		else:
			pass
	else:
		pass
		
func BuildLargeHouse():
	if (largeHouse <= population):
		if (timber >= 450) and (stone >= 250):
			largeHouse += 1
			populationGrowthRate += 0.004
			timber -= 450
			stone -= 250
		else:
			pass
	else:
		pass
#-----------------------------------------

func ResourceCollection():
	timber += (timberGrowthRate + rng.randf_range(1,5))
	stone += (stoneCollectionRate + rng.randf_range(1,8))
	water += (waterCollectionRate + rng.randf_range(3,8))
	food += (foodCollectionRate + rng.randf_range(1,3))
	


func CheckEmployment():
	unemployed = population - (timberCamp + stoneQuarry)
#UI STUFF

