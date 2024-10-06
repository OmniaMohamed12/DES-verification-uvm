if [file exists "work"] {
    vdel -all
}
vlib work
vlog DES_Package.svh DES_Tb.sv +cover
vsim -batch work.DES_Tb -coverage +UVM_TESTNAME=DES_Test
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all 
coverage report -codeAll -cvg -verbose

