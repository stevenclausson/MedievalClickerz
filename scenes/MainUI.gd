extends Control

onready var population = Global.population
onready var food = Global.food
onready var water = Global.water
onready var timber = Global.timber
onready var stone = Global.stone
onready var day = Global.day

func _ready():
	var timer = Timer.new()
	add_child(timer)
	timer.set_wait_time(5)
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start()

func UpdateUIData():
	$TopUIPanel/PopulationLbl.text = "Population: " + str(Global.population)
	$TopUIPanel/FoodLbl.text = "Food: " + str(Global.food)
	$BottomUIPanel/TimberSprite/TimberLbl.text =": " + str(Global.timber)
	$TopUIPanel/DayLbl.text = "Day: " + str(day)
	$BottomUIPanel/StoneSprite/StoneLbl.text = ": " +str(Global.stone)
	$TopUIPanel/UnemployedLbl.text = "Unemployed: " +str(Global.unemployed)
	$TopUIPanel/WaterLbl.text = "Water: " + str(Global.water)

func _on_Timer_timeout():
	EndDay()
	Global.PopulationAppetite()
	Global.PopulationGrowth()
	Global.CheckEmployment()
	Global.ResourceCollection()
	UpdateUIData()

func EndDay():
	day += 1
	$BuildingPanel/TimberCampLbl/Button.disabled = false
	print("Another day has passed...")

func _on_ForageBtn_pressed():
	Global.Forage()
	$TopUIPanel/FoodLbl.text = "Food: " + str(Global.food)


func _on_Button_pressed(): #Timber Camp Build
	Global.BuildTimberCamp()
	$BuildingPanel/TimberCampLbl/Button.disabled = true
	$BuildingPanel/TimberCampLbl/Label.text = str(Global.timberCamp)
