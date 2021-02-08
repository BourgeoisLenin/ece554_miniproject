onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /systolic_array_tb/DUT/z
add wave -noupdate /systolic_array_tb/DUT/rst_n
add wave -noupdate /systolic_array_tb/DUT/en
add wave -noupdate /systolic_array_tb/DUT/clk
add wave -noupdate /systolic_array_tb/DUT/WrEnRows
add wave -noupdate /systolic_array_tb/DUT/WrEn
add wave -noupdate /systolic_array_tb/DUT/DIM
add wave -noupdate /systolic_array_tb/DUT/Crow
add wave -noupdate -radix decimal -childformat {{{/systolic_array_tb/DUT/Couts[7]} -radix decimal} {{/systolic_array_tb/DUT/Couts[6]} -radix decimal} {{/systolic_array_tb/DUT/Couts[5]} -radix decimal} {{/systolic_array_tb/DUT/Couts[4]} -radix decimal} {{/systolic_array_tb/DUT/Couts[3]} -radix decimal} {{/systolic_array_tb/DUT/Couts[2]} -radix decimal} {{/systolic_array_tb/DUT/Couts[1]} -radix decimal} {{/systolic_array_tb/DUT/Couts[0]} -radix decimal}} -expand -subitemconfig {{/systolic_array_tb/DUT/Couts[7]} {-radix decimal} {/systolic_array_tb/DUT/Couts[6]} {-radix decimal} {/systolic_array_tb/DUT/Couts[5]} {-radix decimal} {/systolic_array_tb/DUT/Couts[4]} {-radix decimal} {/systolic_array_tb/DUT/Couts[3]} {-radix decimal} {/systolic_array_tb/DUT/Couts[2]} {-radix decimal} {/systolic_array_tb/DUT/Couts[1]} {-radix decimal} {/systolic_array_tb/DUT/Couts[0]} {-radix decimal}} /systolic_array_tb/DUT/Couts
add wave -noupdate -radix decimal /systolic_array_tb/DUT/Cout
add wave -noupdate /systolic_array_tb/DUT/Cins
add wave -noupdate -childformat {{{/systolic_array_tb/DUT/Cin[7]} -radix decimal} {{/systolic_array_tb/DUT/Cin[6]} -radix decimal} {{/systolic_array_tb/DUT/Cin[5]} -radix decimal} {{/systolic_array_tb/DUT/Cin[4]} -radix decimal} {{/systolic_array_tb/DUT/Cin[3]} -radix decimal} {{/systolic_array_tb/DUT/Cin[2]} -radix decimal} {{/systolic_array_tb/DUT/Cin[1]} -radix decimal} {{/systolic_array_tb/DUT/Cin[0]} -radix decimal}} -expand -subitemconfig {{/systolic_array_tb/DUT/Cin[7]} {-radix decimal} {/systolic_array_tb/DUT/Cin[6]} {-radix decimal} {/systolic_array_tb/DUT/Cin[5]} {-radix decimal} {/systolic_array_tb/DUT/Cin[4]} {-radix decimal} {/systolic_array_tb/DUT/Cin[3]} {-radix decimal} {/systolic_array_tb/DUT/Cin[2]} {-radix decimal} {/systolic_array_tb/DUT/Cin[1]} {-radix decimal} {/systolic_array_tb/DUT/Cin[0]} {-radix decimal}} /systolic_array_tb/DUT/Cin
add wave -noupdate -radix decimal -expand /systolic_array_tb/DUT/Binter
add wave -noupdate /systolic_array_tb/DUT/BITS_C
add wave -noupdate /systolic_array_tb/DUT/BITS_AB
add wave -noupdate /systolic_array_tb/DUT/B
add wave -noupdate -radix decimal -childformat {{{/systolic_array_tb/DUT/Ainter[7]} -radix decimal} {{/systolic_array_tb/DUT/Ainter[6]} -radix decimal} {{/systolic_array_tb/DUT/Ainter[5]} -radix decimal} {{/systolic_array_tb/DUT/Ainter[4]} -radix decimal} {{/systolic_array_tb/DUT/Ainter[3]} -radix decimal} {{/systolic_array_tb/DUT/Ainter[2]} -radix decimal} {{/systolic_array_tb/DUT/Ainter[1]} -radix decimal} {{/systolic_array_tb/DUT/Ainter[0]} -radix decimal}} -expand -subitemconfig {{/systolic_array_tb/DUT/Ainter[7]} {-radix decimal} {/systolic_array_tb/DUT/Ainter[6]} {-radix decimal} {/systolic_array_tb/DUT/Ainter[5]} {-radix decimal} {/systolic_array_tb/DUT/Ainter[4]} {-radix decimal} {/systolic_array_tb/DUT/Ainter[3]} {-radix decimal} {/systolic_array_tb/DUT/Ainter[2]} {-radix decimal} {/systolic_array_tb/DUT/Ainter[1]} {-radix decimal} {/systolic_array_tb/DUT/Ainter[0]} {-radix decimal}} /systolic_array_tb/DUT/Ainter
add wave -noupdate /systolic_array_tb/DUT/A
add wave -noupdate /systolic_array_tb/mycycle
add wave -noupdate /systolic_array_tb/errors
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {650 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 231
configure wave -valuecolwidth 415
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1010 ns}
