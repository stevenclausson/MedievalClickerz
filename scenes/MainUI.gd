extends Control

@onready var population = Global.population
@onready var food = Global.food
@onready var water = Global.water
@onready var timber = Global.timber
@onready var stone = Global.stone
@onready var day = Global.day
@onready var year = Global.year

func _ready():
	var timer = Timer.new()
	add_child(timer)
	timer.set_wait_time(3)
	timer.connect("timeout",Callable(self,"_on_Timer_timeout"))
	timer.start()

func UpdateUIData():
	$TopUIPanel/PopulationLbl.text = "Population: " + str(Global.population)
	$TopUIPanel/FoodLbl.text = "Food: " + str(Global.food)
	$BottomUIPanel/TimberSprite/TimberLbl.text =": " + str(Global.timber)
	$TopUIPanel/DayLbl.text = "Day: " + str(Global.day)
	$BottomUIPanel/StoneSprite/StoneLbl.text = ": " +str(Global.stone)
	$TopUIPanel/UnemployedLbl.text = "Unemployed: " +str(Global.unemployed)
	$TopUIPanel/WaterLbl.text = "Water: " + str(Global.water)
	$TopUIPanel/YearLbl.text = "Year: " + str(Global.year)
func _on_Timer_timeout():
	EndDay()
	Global.PopulationAppetite()
	Global.PopulationGrowth()
	Global.CheckEmployment()
	Global.ResourceCollection()
	UpdateUIData()

func EndDay():
	if (Global.day <= 365):
		Global.day +=1
	elif(Global.day > 365):
		Global.day = 0
		Global.year += 1
	$BuildingPanel/TimberCampLbl/Button.disabled = false
	$BuildingPanel/PrimWellLbl/BuildPWellBtn.disabled = false
	$BuildingPanel/SmallHouseLbl/BuildSmallHouseBtn.disabled = false
	$BuildingPanel/FamFarmLbl/BuildFamFarmBtn.disabled = false
	$BuildingPanel/LargeHouseLbl2/BuildLHouseBtn.disabled = false
	$BuildingPanel/StoneQuarryLbl/BuildQuarryBtn.disabled = false
	print("Another day has passed...")

func _on_ForageBtn_pressed():
	Global.Forage()
	$TopUIPanel/FoodLbl.text = "Food: " + str(Global.food)


func _on_Button_pressed(): #Timber Camp Build
	Global.BuildTimberCamp()
	$BuildingPanel/TimberCampLbl/Button.disabled = true
	$BuildingPanel/TimberCampLbl/Label.text = str(Global.timberCamp)

func _on_BuildPWellBtn_pressed():
	Global.BuildPrimitiveWell()
	$BuildingPanel/PrimWellLbl/BuildPWellBtn.disabled = true
	$BuildingPanel/PrimWellLbl/PWellTextLbl.text = str(Global.primitiveWell)

func _on_BuildSmallHouseBtn_pressed():
	Global.BuildSmallHouse()
	$BuildingPanel/SmallHouseLbl/BuildSmallHouseBtn.disabled = true
	$BuildingPanel/SmallHouseLbl/SmallHouseTxt.text = str(Global.smallHouse)


func _on_BuildFamFarmBtn_pressed():
	Global.BuildFamilyFarm()
	$BuildingPanel/FamFarmLbl/FamFarmTxtLbl.text = str(Global.familyFarm)
	$BuildingPanel/FamFarmLbl/BuildFamFarmBtn.disabled = true


func _on_BuildLHouseBtn_pressed():
	Global.BuildLargeHouse()
	$BuildingPanel/LargeHouseLbl2/BuildLHouseBtn.disabled = true
	$BuildingPanel/LargeHouseLbl2/LHouseTxtLbl.text = str(Global.largeHouse)


func _on_BuildQuarryBtn_pressed():
	Global.BuildStoneQuarry()
	$BuildingPanel/StoneQuarryLbl/BuildQuarryBtn.disabled = true
	$BuildingPanel/StoneQuarryLbl/SQuarryTextLbl.text = str(Global.stoneQuarry)


func _on_SaveBtn_pressed():
	Global.save_data(Global.player_file_path)


func _on_LoadBtn_pressed():
	Global.load_data(Global.player_file_path)
