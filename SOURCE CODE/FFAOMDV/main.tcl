# explicitly setup our main window

wm geometry  . 850x350+300+200
wm title  .   "Energy Efficient Multipath Routing Protocol for Mobile ad-hoc Network Using the Fitness Function"

# setup the frame stuff

destroy .myArea
set f [frame .myArea -borderwidth 5 -background darkblue]
pack $f -side top -expand true -fill both

# create a menubar

destroy .menubar
menu .menubar
. config -menu .menubar

#  create a pull down menu with a label 

set File2 [menu .menubar.mFile2]
.menubar add cascade -label "FFAOMDV"  -menu  .menubar.mFile2

set File3 [menu .menubar.mFile3]
.menubar add cascade -label "PerformanceEvaluation"  -menu  .menubar.mFile3

set close [menu .menubar.sFile]
.menubar add cascade -label Quit  -menu  .menubar.sFile

# add the menu item

$File2 add command -label Run_FFAOMDV -command {exec ./ns EEMRP.tcl &}
$File2 add command -label Run_Simulation -command {exec nam out.nam &}

$File3 add command -label PacketDelivery -command {exec xgraph PDR_AOMDV.tr PDR_AOMR_LM.tr PDR_FFAOMDV.tr -x "No.of.nodes" -y "PDR(%)" -bg "darkgrey" -fg "black" -zg "white" -lw 1 -M -bb &}
$File3 add command -label Throughput -command {exec xgraph THPT_AOMDV.tr THPT_AOMR_LM.tr THPT_FFAOMDV.tr -x "SimulationTime(s)" -y "Throughput(kbps)" -lw 5 -bg "darkgrey" -fg "black" -zg "white" -lw 1 -M -bb &}
$File3 add command -label E2Edelay -command {exec xgraph E2E_AOMDV.tr E2E_AOMR_LM.tr E2E_FFAOMDV.tr -x "PacketSize(bytes)" -y "E2Edelay(ms)" -lw 5  -bg "darkgrey" -fg "black" -zg "white" -lw 1 -M -bb &}
$File3 add command -label EnergyConsumption -command {exec xgraph EC_AOMDV.tr EC_AOMR_LM.tr EC_FFAOMDV.tr -x "NodeSpeed(m/s)" -y "EnergyConsumption(Joules)" -lw 5  -bg "darkgrey" -fg "black" -zg "white" -lw 1 -M -bb &}
$File3 add command -label NetworkLifetime -command {exec xgraph NL_AOMDV.tr NL_AOMR_LM.tr NL_FFAOMDV.tr -x "SimulationTime(s)" -y "NetworkLifetime" -lw 5  -bg "darkgrey" -fg "black" -zg "white" -lw 1 -M -bb &}
$File3 add command -label Routingverhead -command {exec xgraph ROR_AOMDV.tr ROR_AOMR_LM.tr ROR_FFAOMDV.tr -x "SimulationTime(s)" -y "ROR(%)" -lw 5  -bg "darkgrey" -fg "black" -zg "white" -lw 1 -M -bb &}

$close add command -label Quit -command exit
