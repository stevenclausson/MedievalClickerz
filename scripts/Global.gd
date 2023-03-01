extends Node

var player_file_path = "user://player_data.json"


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


#------------SAVING/LOADING GAME
var default_data = {
	"day" : 0,
	"year" : 0,
	"population" : 10,
	"unemployed" : 0,
	"populationGrowthRate" : 0.008,
	"food" : 100,
	"foodCollectionRate" : 0,
	"isStarving" : false,
	"starvingDays" : 0,
	"water" : 300,
	"waterCollectionRate" : 0,
	"timber" : 10,
	"timberGrowthRate" : 0,
	"stone" : 10,
	"stoneCollectionRate" : 0,
	"hide" : 20,
	"smallHouse" : 0,
	"largeHouse" : 0,
	"familyFarm" : 0,
	"timberCamp" : 0,
	"stoneQuarry" : 0,
	"primitiveWell" : 0
	
}

var current_data = {}

func reset_data():
	current_data.clear()
	current_data = default_data.diplicate(true)


#func save_data(path : String):
#	var file
#	file = File.new()
#	file.open(path, File.WRITE)
#	file.store_line(JSON.new().stringify(current_data))
#	file.close()
#	print("File saved.")
#
#func load_data(path : String):
#	var file = File.new()
#	file.open(path, File.READ)
#	var test_json_conv = JSON.new()
#	test_json_conv.parse(file.get_as_text())
#	var data_json = test_json_conv.get_data()
#	file.close()
#	current_data = data_json.result
#	print("File loaded.")


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

