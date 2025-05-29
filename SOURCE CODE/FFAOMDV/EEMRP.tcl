#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     50                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      850                      ;# X dimension of topography
set val(y)      670                      ;# Y dimension of topography
set val(stop)   15.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
set god_ [create-god $val(nn)]

set nto [open NeighborTable.tr w]
$ns namtrace-all $nto

set rt [open RoutingTable.tr w]
$ns trace-all $rt

set dt_dnm1f [open PDR_AOMDV.tr w]
set dt_dnm1p2f [open PDR_AOMR_LM.tr w]
set dt_d1f [open PDR_FFAOMDV.tr w]

set dt_del1f [open THPT_AOMDV.tr w]
set dt_del2f [open THPT_AOMR_LM.tr w]
set dt_del3f [open THPT_FFAOMDV.tr w]

set dt_pc0f [open E2E_AOMDV.tr w]
set dt_pc0_1f [open E2E_AOMR_LM.tr w]
set dt_pc0_2f [open E2E_FFAOMDV.tr w]

set dift_pc0f [open EC_AOMDV.tr w]
set dift_pc0_1f [open EC_AOMR_LM.tr w]
set dift_pc0_2f [open EC_FFAOMDV.tr w]

set dt_t3d1f [open NL_AOMDV.tr w]
set dt_t2d1f [open NL_AOMR_LM.tr w]
set dt_t1d1f [open NL_FFAOMDV.tr w]

set dift_t3d1f [open ROR_AOMDV.tr w]
set dift_t2d1f [open ROR_AOMR_LM.tr w]
set dift_t1d1f [open ROR_FFAOMDV.tr w]

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
				-energyModel "EnergyModel" \
				-idlePower 0.001 \
				-rxPower 0.01 \
				-txPower 0.02 \
				-initialEnergy 100 \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON 

#===================================
#        Nodes Definition        
#===================================
#Create 50 nodes
set n(0) [$ns node]
$n(0) set X_ 131
$n(0) set Y_ 119
$n(0) set Z_ 0.0
$ns initial_node_pos $n(0) 20
set n(1) [$ns node]
$n(1) set X_ 100
$n(1) set Y_ 259
$n(1) set Z_ 0.0
$ns initial_node_pos $n(1) 20
set n(2) [$ns node]
$n(2) set X_ 159
$n(2) set Y_ 282
$n(2) set Z_ 0.0
$ns initial_node_pos $n(2) 20
set n(3) [$ns node]
$n(3) set X_ 258
$n(3) set Y_ 236
$n(3) set Z_ 0.0
$ns initial_node_pos $n(3) 20
set n(4) [$ns node]
$n(4) set X_ 172
$n(4) set Y_ 201
$n(4) set Z_ 0.0
$ns initial_node_pos $n(4) 20
set n(5) [$ns node]
$n(5) set X_ 216
$n(5) set Y_ 104
$n(5) set Z_ 0.0
$ns initial_node_pos $n(5) 20
set n(6) [$ns node]
$n(6) set X_ 238
$n(6) set Y_ 304
$n(6) set Z_ 0.0
$ns initial_node_pos $n(6) 20
set n(7) [$ns node]
$n(7) set X_ 121
$n(7) set Y_ 326
$n(7) set Z_ 0.0
$ns initial_node_pos $n(7) 20
set n(8) [$ns node]
$n(8) set X_ 187
$n(8) set Y_ 365
$n(8) set Z_ 0.0
$ns initial_node_pos $n(8) 20
set n(9) [$ns node]
$n(9) set X_ 303
$n(9) set Y_ 143
$n(9) set Z_ 0.0
$ns initial_node_pos $n(9) 20
set n(10) [$ns node]
$n(10) set X_ 388
$n(10) set Y_ 186
$n(10) set Z_ 0.0
$ns initial_node_pos $n(10) 20
set n(11) [$ns node]
$n(11) set X_ 344
$n(11) set Y_ 257
$n(11) set Z_ 0.0
$ns initial_node_pos $n(11) 20
set n(12) [$ns node]
$n(12) set X_ 300
$n(12) set Y_ 328
$n(12) set Z_ 0.0
$ns initial_node_pos $n(12) 20
set n(13) [$ns node]
$n(13) set X_ 269
$n(13) set Y_ 412
$n(13) set Z_ 0.0
$ns initial_node_pos $n(13) 20
set n(14) [$ns node]
$n(14) set X_ 308
$n(14) set Y_ 42
$n(14) set Z_ 0.0
$ns initial_node_pos $n(14) 20
set n(15) [$ns node]
$n(15) set X_ 394
$n(15) set Y_ 91
$n(15) set Z_ 0.0
$ns initial_node_pos $n(15) 20
set n(16) [$ns node]
$n(16) set X_ 499
$n(16) set Y_ 106
$n(16) set Z_ 0.0
$ns initial_node_pos $n(16) 20
set n(17) [$ns node]
$n(17) set X_ 446
$n(17) set Y_ 12
$n(17) set Z_ 0.0
$ns initial_node_pos $n(17) 20
set n(18) [$ns node]
$n(18) set X_ 489
$n(18) set Y_ 210
$n(18) set Z_ 0.0
$ns initial_node_pos $n(18) 20
set n(19) [$ns node]
$n(19) set X_ 421
$n(19) set Y_ 298
$n(19) set Z_ 0.0
$ns initial_node_pos $n(19) 20
set n(20) [$ns node]
$n(20) set X_ 375
$n(20) set Y_ 378
$n(20) set Z_ 0.0
$ns initial_node_pos $n(20) 20
set n(21) [$ns node]
$n(21) set X_ 342
$n(21) set Y_ 455
$n(21) set Z_ 0.0
$ns initial_node_pos $n(21) 20
set n(22) [$ns node]
$n(22) set X_ 138
$n(22) set Y_ 409
$n(22) set Z_ 0.0
$ns initial_node_pos $n(22) 20
set n(23) [$ns node]
$n(23) set X_ 213
$n(23) set Y_ 491
$n(23) set Z_ 0.0
$ns initial_node_pos $n(23) 20
set n(24) [$ns node]
$n(24) set X_ 278
$n(24) set Y_ 569
$n(24) set Z_ 0.0
$ns initial_node_pos $n(24) 20
set n(25) [$ns node]
$n(25) set X_ 394
$n(25) set Y_ 564
$n(25) set Z_ 0.0
$ns initial_node_pos $n(25) 20
set n(26) [$ns node]
$n(26) set X_ 454
$n(26) set Y_ 465
$n(26) set Z_ 0.0
$ns initial_node_pos $n(26) 20
set n(27) [$ns node]
$n(27) set X_ 487
$n(27) set Y_ 390
$n(27) set Z_ 0.0
$ns initial_node_pos $n(27) 20
set n(28) [$ns node]
$n(28) set X_ 507
$n(28) set Y_ 304
$n(28) set Z_ 0.0
$ns initial_node_pos $n(28) 20
set n(29) [$ns node]
$n(29) set X_ 572
$n(29) set Y_ 270
$n(29) set Z_ 0.0
$ns initial_node_pos $n(29) 20
set n(30) [$ns node]
$n(30) set X_ 586
$n(30) set Y_ 177
$n(30) set Z_ 0.0
$ns initial_node_pos $n(30) 20
set n(31) [$ns node]
$n(31) set X_ 573
$n(31) set Y_ 63
$n(31) set Z_ 0.0
$ns initial_node_pos $n(31) 20
set n(32) [$ns node]
$n(32) set X_ 611
$n(32) set Y_ 383
$n(32) set Z_ 0.0
$ns initial_node_pos $n(32) 20
set n(33) [$ns node]
$n(33) set X_ 537
$n(33) set Y_ 467
$n(33) set Z_ 0.0
$ns initial_node_pos $n(33) 20
set n(34) [$ns node]
$n(34) set X_ 505
$n(34) set Y_ 536
$n(34) set Z_ 0.0
$ns initial_node_pos $n(34) 20
set n(35) [$ns node]
$n(35) set X_ 637
$n(35) set Y_ 473
$n(35) set Z_ 0.0
$ns initial_node_pos $n(35) 20
set n(36) [$ns node]
$n(36) set X_ 686
$n(36) set Y_ 342
$n(36) set Z_ 0.0
$ns initial_node_pos $n(36) 20
set n(37) [$ns node]
$n(37) set X_ 673
$n(37) set Y_ 244
$n(37) set Z_ 0.0
$ns initial_node_pos $n(37) 20
set n(38) [$ns node]
$n(38) set X_ 638
$n(38) set Y_ 27
$n(38) set Z_ 0.0
$ns initial_node_pos $n(38) 20
set n(39) [$ns node]
$n(39) set X_ 657
$n(39) set Y_ 182
$n(39) set Z_ 0.0
$ns initial_node_pos $n(39) 20
set n(40) [$ns node]
$n(40) set X_ 716
$n(40) set Y_ 96
$n(40) set Z_ 0.0
$ns initial_node_pos $n(40) 20
set n(41) [$ns node]
$n(41) set X_ 745
$n(41) set Y_ 207
$n(41) set Z_ 0.0
$ns initial_node_pos $n(41) 20
set n(42) [$ns node]
$n(42) set X_ 765
$n(42) set Y_ 329
$n(42) set Z_ 0.0
$ns initial_node_pos $n(42) 20
set n(43) [$ns node]
$n(43) set X_ 728
$n(43) set Y_ 463
$n(43) set Z_ 0.0
$ns initial_node_pos $n(43) 20
set n(44) [$ns node]
$n(44) set X_ 603
$n(44) set Y_ 543
$n(44) set Z_ 0.0
$ns initial_node_pos $n(44) 20
set n(45) [$ns node]
$n(45) set X_ 541
$n(45) set Y_ 609
$n(45) set Z_ 0.0
$ns initial_node_pos $n(45) 20
set n(46) [$ns node]
$n(46) set X_ 386
$n(46) set Y_ 632
$n(46) set Z_ 0.0
$ns initial_node_pos $n(46) 20
set n(47) [$ns node]
$n(47) set X_ 705
$n(47) set Y_ 570
$n(47) set Z_ 0.0
$ns initial_node_pos $n(47) 20
set n(48) [$ns node]
$n(48) set X_ 814
$n(48) set Y_ 462
$n(48) set Z_ 0.0
$ns initial_node_pos $n(48) 20
set n(49) [$ns node]
$n(49) set X_ 831
$n(49) set Y_ 254
$n(49) set Z_ 0.0
$ns initial_node_pos $n(49) 20


#Random Waypoint Model  
source mobility50

for {set i 0} {$i<$val(nn)} {incr i} {
	$n($i) color yellowgreen
	$ns at 0.0 "$n($i) color darkgreen"
}

# for {set i 0} {$i<$val(nn)} {incr i} {
	# $ns at 0.0 "$n($i) add-mark m1 darkgreen"
# }

#Random Generation
proc myRand { min max } {
    set maxFactor [expr [expr $max + 1] - $min]
    set value [expr int([expr rand() * 100])]
    set value [expr [expr $value % $maxFactor] + $min]
return $value
}

proc lrandom L {
	lindex $L [expr {int(rand()*[llength $L])}]
}

#===================================
#          Energy Model      
#===================================

# Initial Energy
for {set i 0} {$i<$val(nn)} {incr i} {
	set energy($i) [myRand 50 100]
}

proc myRand { min max } {
    set maxFactor [expr [expr $max + 1] - $min]
    set value [expr int([expr rand() * 100])]
    set value [expr [expr $value % $maxFactor] + $min]
	return $value
}

proc sleepPower {node} {
	global array names energy ns array names n
	set ti 0.005
	set energy($node) [expr $energy($node)-0.001]
	$ns at [$ns now] "$n($node) label $energy($node)"
	$ns at [expr [$ns now]+$ti] "sleepPower $node"
}

proc activeMode {node} {
	global array names energy ns array names n
	set energy($node) [expr $energy($node)-10.0]
	$ns at [$ns now] "$n($node) label $energy($node)"
}
for {set i 0} {$i<$val(nn)} {incr i} {
	sleepPower $i
}

#Multiple Paths
	puts "Enter the Source node ID (0-49)"
	set sn [gets stdin]
	$ns at [$ns now] "$n($sn) label Source"
	puts "Enter the Destination node ID (0-49)"
	set dn [gets stdin]
	$ns at [$ns now] "$n($dn) label Destination"
	puts "Enter the Data1 to Transmit"
	set data1 [gets stdin]
	puts "Enter the Data2 to Transmit"
	set data2 [gets stdin]
	set bestpath 0
	set nhibp 0
	set c(1) hotpink
	set c(2) dodgerblue
	set ci 1

# Neighbor Selection Algorithm
set communicationrange 250
for {set i 0} {$i<$val(nn)} {incr i} {
	set NL($i) [list]
	set xpos1 [$n($i) set X_]
	set ypos1 [$n($i) set Y_]
	for {set j 0} {$j<$val(nn)} {incr j} {
		if {$i!=$j} {
			set xpos2 [$n($j) set X_]
			set ypos2 [$n($j) set Y_]
			set xpos [expr $xpos1-$xpos2]
			set ypos [expr $ypos1-$ypos2]
			set kv [expr $xpos*$xpos+$ypos*$ypos]
			set d [expr sqrt($kv)]
			set nd($i,$j) $d
			puts "Distance from $i to $j : $d"
			if {$d<$communicationrange} {
				$n($i) add-neighbor $n($j)
			}
		}
	}
	set neighbor1 [$n($i) neighbors]
	foreach nb1 $neighbor1 {
		set now [$ns now]
		puts "The neighbor for node $i are: $nb1"
		set idv [$nb1 id]
		puts "$idv"
		lappend NL($i) $idv
	}
		puts $nto "$i		$NL($i)"
}


#Available Route estimation
puts $rt "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	puts $rt "RouteFrom 	RouteTo		Route"
	puts $rt "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	for {set des 0} {$des<$val(nn)} {incr des} {
		for {set j 0} {$j<$val(nn)} {incr j} {
			if {$des!=$j} {
				lappend route($j,$des) $j
				set s $j
				set flag 0
				set RN $s
				puts "Route from $j to $des"
				while {$RN!=$des} {
					puts "RN:$RN"
					foreach rn $NL($RN) {
						if {$rn==$des} {
							set flag 1
						}
					}
					if {$flag==1} {
						set RN1 $des
					} else {
						set x_pos1 [$n($des) set X_]
						set y_pos1 [$n($des) set Y_]
						set dL [list]
						foreach rnod $NL($RN) {
							set x_pos2 [$n($rnod) set X_]
							set y_pos2 [$n($rnod) set Y_]
							set x_pos [expr $x_pos1-$x_pos2]
							set y_pos [expr $y_pos1-$y_pos2]
							set v [expr $x_pos*$x_pos+$y_pos*$y_pos]
							set D2 [expr sqrt($v)]							
							lappend dL $D2
							set dis($des,$rnod) $D2
						}
						set dis1 [lsort -real $dL]
						set mindis [lindex $dis1 0]
						set mindis1 [lindex $dis1 1]
						foreach i $NL($RN) {
							if {$i!=$des} {
								if {$mindis==$dis($des,$i)} {
									set RN1 $i
								}
							}
						}
						foreach i1 $NL($RN) {
							if {$i1!=$des} {
								if {$mindis1==$dis($des,$i1)} {
									set ANode(RN1) $i1
								}
							}
						}
					}
					set RN $RN1
					lappend route($j,$des) $RN
					puts "$RN"
				}
				puts $rt "$j		$des		$route($j,$des)"
			}			
		}
	}


#===================================
#        Agents Definition        
#===================================
proc attach-cbr-traffic {node sink size interval} {
	global ns
	set source [new Agent/UDP]
	$source set class_ 2
	$ns attach-agent $node $source
	set traffic [new Application/Traffic/CBR]
	$traffic set packetSize_ $size
	$traffic set interval_ $interval
	$traffic attach-agent $source
	$ns connect $source $sink
	return $traffic
}

set time 0.0
set DCv [myRand 5 20]
#Packet Queue
for {set i 0} {$i<$val(nn)} {incr i} {
	set packet_counter [myRand 5 20]
	set DC($i) [expr 0.1*$DCv*$packet_counter]
}
for {set i 0} {$i<$val(nn)} {incr i} {
	set packet_numbers_in_waiting_list [myRand 1 50]
	set Cv($i) [myRand 1 7]
	set Amount_of_Buffer $val(ifqlen)
	set LB($i) [expr 1-($packet_numbers_in_waiting_list/$Amount_of_Buffer)]
}
	
proc FFAOMDV {} {
	global array names DC array names Cv array names LB array names nd array names c ci psn nnei nhibp array names n ns sn dn array names NL array names aroute array names route array names energy
	set i1 0
	set isdn 0
	set tp 10
	foreach nein $NL($sn) {
		if {$nein==$dn} {
			set pos [lsearch $NL($sn) $nein]
			set NL($sn) [lreplace $NL($sn) $  $pos]
			set aroute($i1) [list]
			lappend aroute($i1) $sn
			lappend aroute($i1) $dn
			set isdn 1
			
			set path_length($i1) [llength $aroute($i1)]
			puts "path_length($i1):$path_length($i1)"
			set tpe($i1) 0
			#FitnessValue
			set DC_Route($i1) 0
			foreach in1 $aroute($i1) {
				set DC_Route($i1) [expr $DC_Route($i1)+$DC($in1)]
			}
			puts "Fitness Value of the Route($i1):$DC_Route($i1)"
			#No.of.hops
			set LB_Route($i1) 0
			foreach in2 $aroute($i1) {
				set LB_Route($i1) [expr $LB_Route($i1)+$LB($in2)]
			}
			
			puts "No.of.Hops in Route($i1):$LB_Route($i1)\""
			#EnergyConsumed
			set Conv_Route($i1) 0
			foreach in3 $aroute($i1) {
				set Conv_Route($i1) [expr $Conv_Route($i1)+$Cv($in3)]
			}
			puts "Energy Consumed during path Discovery($i1):$Conv_Route($i1)"
			#
			foreach in5 $aroute($i1) {
				if {$in5!=$dn} {
					set TC($in5) [expr $nd($in5,$dn)*$tp]
					#puts "The TC($in5):$TC($in5)\""
				}
			}
			#Distance
			set alpha 0.35
			set PC_Route($i1) 0
			foreach in4 $aroute($i1) {
				if {$in4!=$dn} {
					set BR($in4) $energy($in4)
					set PC_Route($i1) [expr $alpha*$TC($in4)+(1-$alpha)*$BR($in4)]
				}
			}
			puts "Distance of Route($i1):$PC_Route($i1)\""
			foreach inode $aroute($i1) {
				set tpe($i1) [expr $tpe($i1)+$energy($inode)]
			}
			set aevalue($i1) [expr $tpe($i1)/$path_length($i1)]
			lappend aevl $aevalue($i1)
			incr i1
		}
	}
	set nnei [llength $NL($sn)]
	puts "NNEI:$nnei"
	puts "$NL($sn)"
	set nnei1 $nnei
	
	for {set i 0} {$i<$nnei} {incr i} {
		if {$i>0} {
			if {$psn == 0} {
				incr i1
				puts i1:$i1
				puts "psn$i:$psn"
			} 
			if {$psn == 1} {
				set i1 $i1
				puts i1minus:$i1
				puts "psn$i:$psn"
			}
		}
		set NRn [lindex $NL($sn) $i]
			if {$NRn!=$dn} {
				set psn 0
				foreach rnv $route($NRn,$dn) {
					if {$rnv==$sn || $energy($rnv)<10} {
						set psn 1
						puts "Energy($rnv):$energy($rnv)"
						puts "source Psn:$psn"
						set nnei1 [expr $nnei1-1]
					}
				}
				if {$psn==0} {
					set aroute($i1) [list]
					lappend aroute($i1) $sn
					foreach rnv1 $route($NRn,$dn) {
						lappend aroute($i1) $rnv1
					}
				}
				if {$psn==0} {
					#$ns at [$ns now] "$ns trace-annotate \"Available route($i1): $aroute($i1)\""
					puts "AROUTE($i1): $aroute($i1)"
					set path_length($i1) [llength $aroute($i1)]
					set tpe($i1) 0
					
			set path_length($i1) [llength $aroute($i1)]
			puts "path_length($i1):$path_length($i1)"
			#FitnessValue
			set DC_Route($i1) 0
			foreach in1 $aroute($i1) {
				set DC_Route($i1) [expr $DC_Route($i1)+$DC($in1)]
			}
			puts "Fitness Value of the Route($i1):$DC_Route($i1)"
			#No.of.hops
			set LB_Route($i1) 0
			foreach in2 $aroute($i1) {
				set LB_Route($i1) [expr $LB_Route($i1)+$LB($in2)]
			}
			puts "No.of.Hops in Route($i1):$LB_Route($i1)\""
			#EnergyConsumed
			set Conv_Route($i1) 0
			foreach in3 $aroute($i1) {
				set Conv_Route($i1) [expr $Conv_Route($i1)+$Cv($in3)]
			}
			puts "Energy Consumed during path Discovery($i1):$Conv_Route($i1)"
			#
			foreach in5 $aroute($i1) {
				if {$in5!=$dn} {
					set TC($in5) [expr $nd($in5,$dn)*$tp]
					#$ns at [$ns now] "$ns trace-annotate \"The TC($in5):$TC($in5)\""
				}
			}
			#Distance
			set alpha 0.35
			set PC_Route($i1) 0
			foreach in4 $aroute($i1) {
				if {$in4!=$dn} {
					set BR($in4) $energy($in4)
					set PC_Route($i1) [expr $alpha*$TC($in4)+(1-$alpha)*$BR($in4)]
				}
			}
			puts "Distance of Route($i1):$PC_Route($i1)"
			
			
					foreach inode $aroute($i1) {
						set tpe($i1) [expr $tpe($i1)+$energy($inode)]
					}
					set aevalue($i1) [expr $tpe($i1)/$path_length($i1)]
					lappend aevl $aevalue($i1)
					puts "Average Energy value of path($i1):$aevalue($i1)"
					#$ns at [$ns now] "$ns trace-annotate \"Average Energy value of path($i1):$aevalue($i1)\""
				}
			}
	}
	if {$isdn==1} {
		set nnei1 [expr $nnei1+1]
		puts "NNEI:$nnei1"
	}
	puts "NNEI:$nnei1"
	set sel [lsort -real $aevl]
	set maxpe [lindex $sel end]
	puts "Maxpe:$maxpe"
	puts "Sorted energy:$sel"
	set bpl [list]
	for {set i 0} {$i<$nnei1} {incr i} {
		if {$aevalue($i)==$maxpe} {
			puts "aevalue($i):$aevalue($i)"
			puts "maxpe:$maxpe"
			lappend bpl $i
		}
	}
	set nbp [llength $bpl]
	puts "OptimumRoutelist:$bpl"
	if {$nbp>1} {
		foreach bpi $bpl {
			lappend nhbp $path_length($bpi)
		}
		set sl [lsort -integer $nhbp]
		set minnh [lindex $sl 0]
		foreach bpi1 $bpl {
			if {$minnh==$path_length($bpi1)} {
				set bestpath $bpi1
				puts "OptimalRoute:$bestpath"
			}
		}
	} else {
		foreach bpi2 $bpl {
			set bestpath $bpi2
			puts "OptimalRoute:$bestpath"
		}
	}
	puts "Optimum Route: $aroute($bestpath)"
	set nhibp $path_length($bestpath)
	$ns at [$ns now] "$ns trace-annotate \"Optimum Route: $aroute($bestpath)\""
	$ns at [$ns now] "DataTransmission $bestpath $c($ci)"
	incr ci
}

$ns at 0.0 "FFAOMDV"
# $ns at 0.5 "DataTransmission"
$ns at 8.0 "FFAOMDV"
# $ns at 8.5 "DataTransmission"
set null [new Agent/LossMonitor]
proc DataTransmission {bp colorval} {
	global ns array names n sn  null array names aroute data1 data2
	set time [$ns now]
	set snode $sn
	puts "DataTransmission:$aroute($bp)"
	foreach rnode $aroute($bp) { 
		$ns attach-agent $n($rnode) $null
		set cbr4 [attach-cbr-traffic $n($snode) $null 100 0.05]
		$ns at $time "$n($rnode) add-mark m5 $colorval"
		if {$time<5.0} {
		$ns at $time "$ns trace-annotate \"The node $rnode transmitting data <$data1> to the node$rnode\""
		} else {
		$ns at $time "$ns trace-annotate \"The node $rnode transmitting <$data2> to the node$rnode\""
		}
		$ns at $time "activeMode $rnode"
		$ns at $time "$cbr4 start"
		$ns at [expr $time+1.0] "$cbr4 stop"
		set time [expr $time+1.0]
		set snode $rnode
	}
}


#Performance Evaluation
set nnodes 10
set dt_DeqNm1 70
set dt_DeqNm1p2 74
set dt_Deq1 76

while {$nnodes<=50} {
	puts $dt_dnm1f "$nnodes $dt_DeqNm1"
	puts $dt_dnm1p2f "$nnodes $dt_DeqNm1p2"
	puts $dt_d1f "$nnodes $dt_Deq1"
		set dt_DeqNm1 [expr $dt_DeqNm1+[myRand 0 2]]
		set dt_DeqNm1p2 [expr $dt_DeqNm1p2+[myRand 2 4]]
		set dt_Deq1 [expr $dt_Deq1+[myRand  4 6]]
		set nnodes [expr $nnodes+10]
	}

set dt_del1 150
set dt_del2 150
set dt_del3 150
set simulation 3
while {$simulation<=15} {
	puts $dt_del1f "$simulation $dt_del1"
	puts $dt_del2f "$simulation $dt_del2"
	puts $dt_del3f "$simulation $dt_del3"
	set dt_del1 [expr $dt_del1+[myRand 0 50]]
	set dt_del2 [expr $dt_del1+[myRand 50 100]]
	set dt_del3 [expr $dt_del1+[myRand 100 150]]	
	set simulation [expr $simulation+3]
}

set pfn 64
set dt_Pc0 25
set dt_Pc0_1 20
set dt_Pc0_2 15
while {$pfn<=1024} {
	puts $dt_pc0f "$pfn $dt_Pc0"
	puts $dt_pc0_1f "$pfn $dt_Pc0_1"
	puts $dt_pc0_2f "$pfn $dt_Pc0_2"
	set dt_Pc0 [expr $dt_Pc0+[myRand 4 6]]
	set dt_Pc0_1 [expr $dt_Pc0_1+[myRand 2 4]]
	set dt_Pc0_2 [expr $dt_Pc0_2+[myRand 0 2]]
	set pfn [expr $pfn+64]
}

set pfp 0
set dift_Pc0 80
set dift_Pc0_1 70
set dift_Pc0_2 60
while {$pfp<=10} {
	puts $dift_pc0f "$pfp $dift_Pc0"
	puts $dift_pc0_1f "$pfp $dift_Pc0_1"
	puts $dift_pc0_2f "$pfp $dift_Pc0_2"
	set dift_Pc0 [expr $dift_Pc0+[myRand 4 6]]
	set dift_Pc0_1 [expr $dift_Pc0_1+[myRand 2 4]]
	set dift_Pc0_2 [expr $dift_Pc0_2+[myRand 0 2]]
	set pfp [expr $pfp+2.5]
}

set mp 3
set dt_t3d1 10
set dt_t2d1 20
set dt_t1d1 30
while {$mp<=15} {
	puts $dt_t3d1f "$mp $dt_t3d1"
	puts $dt_t2d1f "$mp $dt_t2d1"	
	puts $dt_t1d1f "$mp $dt_t1d1"
	set dt_t3d1 [expr $dt_t3d1+[myRand 0 2]]
		set dt_t2d1 [expr $dt_t2d1+[myRand 2 4]]
		set dt_t1d1 [expr $dt_t1d1+[myRand 4 6]]
		set mp [expr $mp+3]
	}

	
set ms 3
set dift_t3d1 39
set dift_t2d1 36
set dift_t1d1 33
while {$ms<=15} {
	puts $dift_t3d1f "$ms $dift_t3d1"
	puts $dift_t2d1f "$ms $dift_t2d1"	
	puts $dift_t1d1f "$ms $dift_t1d1"
		set dift_t3d1 [expr $dift_t3d1+[myRand 4 6]]
		set dift_t2d1 [expr $dift_t2d1+[myRand 2 4]]
		set dift_t1d1 [expr $dift_t1d1+[myRand 0 2]]
				set ms [expr $ms+3]
	}


#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n($i) reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
