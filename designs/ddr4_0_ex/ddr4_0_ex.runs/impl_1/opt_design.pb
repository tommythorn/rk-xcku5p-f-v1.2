
O
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xcku5p2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xcku5p2default:defaultZ17-349h px� 
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px� 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px� 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 3183.305 ; gain = 10.1602default:defaulth px� 
g

Starting %s Task
103*constraints2,
Cache Timing Information2default:defaultZ18-103h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
8
Deriving generated clocks
2*timingZ38-2h px� 
h
%s*common2O
;Ending Cache Timing Information Task | Checksum: 15e7d91af
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 3537.730 ; gain = 354.4262default:defaulth px� 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px� 
�

Phase %s%s
101*constraints2
1 2default:default25
!Generate And Synthesize MIG Cores2default:defaultZ18-101h px� 
�
<Added synthesis output to IP cache for IP %s, cache-ID = %s
2511*coregen2

ddr4_0_phy2default:default2$
3a85647cb5047be12default:defaultZ19-5647h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0122default:default2
3925.4732default:default2
0.0002default:defaultZ17-268h px� 
m
%s*common2T
@Phase 1 Generate And Synthesize MIG Cores | Checksum: 110ebed8d
2default:defaulth px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:10 ; elapsed = 00:01:05 . Memory (MB): peak = 3925.473 ; gain = 20.7702default:defaulth px� 
�

Phase %s%s
101*constraints2
2 2default:default27
#Generate And Synthesize Debug Cores2default:defaultZ18-101h px� 
k
)Generating Script for core instance : %s 214*	chipscope2
dbg_hub2default:defaultZ16-329h px� 
�
Generating IP %s for %s.
1712*coregen2+
xilinx.com:ip:xsdbm:3.02default:default2

dbg_hub_CV2default:defaultZ19-3806h px� 
�
;Using cached IP synthesis design for IP %s, cache-ID = %s.
286*	chipscope2+
xilinx.com:ip:xsdbm:3.02default:default2$
4a261cc67a0a518b2default:defaultZ16-469h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0362default:default2
3953.7972default:default2
0.0002default:defaultZ17-268h px� 
o
%s*common2V
BPhase 2 Generate And Synthesize Debug Cores | Checksum: 1464a73b8
2default:defaulth px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:15 ; elapsed = 00:01:32 . Memory (MB): peak = 3953.797 ; gain = 49.0942default:defaulth px� 
i

Phase %s%s
101*constraints2
3 2default:default2
Retarget2default:defaultZ18-101h px� 
�
9Pulled %s inverters resulting in an inversion of %s pins
779*opt2
182default:default2
1982default:defaultZ31-1566h px� 
x
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
402default:default2
6572default:defaultZ31-138h px� 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px� 
T
%s*common2;
'Phase 3 Retarget | Checksum: 1677e7660
2default:defaulth px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:16 ; elapsed = 00:01:34 . Memory (MB): peak = 3953.797 ; gain = 49.0942default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Retarget2default:default2
2282default:default2
3542default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Retarget2default:default2
672default:defaultZ31-1021h px� 
u

Phase %s%s
101*constraints2
4 2default:default2(
Constant propagation2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
_
%s*common2F
2Phase 4 Constant propagation | Checksum: fec21502
2default:defaulth px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:17 ; elapsed = 00:01:34 . Memory (MB): peak = 3953.797 ; gain = 49.0942default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2(
Constant propagation2default:default2
5092default:default2
11942default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2(
Constant propagation2default:default2
652default:defaultZ31-1021h px� 
f

Phase %s%s
101*constraints2
5 2default:default2
Sweep2default:defaultZ18-101h px� 
P
%s*common27
#Phase 5 Sweep | Checksum: b15433eb
2default:defaulth px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:01:35 . Memory (MB): peak = 3953.797 ; gain = 49.0942default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2default:default2
12default:default2
1912default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Sweep2default:default2
19922default:defaultZ31-1021h px� 
r

Phase %s%s
101*constraints2
6 2default:default2%
BUFG optimization2default:defaultZ18-101h px� 
�
PPhase BUFG optimization inserted %s global clock buffer(s) for CLOCK_LOW_FANOUT.553*opt2
02default:defaultZ31-1077h px� 
]
%s*common2D
0Phase 6 BUFG optimization | Checksum: 12a289a38
2default:defaulth px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:01:35 . Memory (MB): peak = 3953.797 ; gain = 49.0942default:defaulth px� 
�
EPhase %s created %s cells of which %s are BUFGs and removed %s cells.395*opt2%
BUFG optimization2default:default2
12default:default2
12default:default2
22default:defaultZ31-662h px� 
|

Phase %s%s
101*constraints2
7 2default:default2/
Shift Register Optimization2default:defaultZ18-101h px� 
�
dSRL Remap converted %s SRLs to %s registers and converted %s registers of register chains to %s SRLs546*opt2
02default:default2
02default:default2
02default:default2
02default:defaultZ31-1064h px� 
g
%s*common2N
:Phase 7 Shift Register Optimization | Checksum: 12a71fc2a
2default:defaulth px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:19 ; elapsed = 00:01:36 . Memory (MB): peak = 3953.797 ; gain = 49.0942default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2/
Shift Register Optimization2default:default2
02default:default2
02default:defaultZ31-389h px� 
x

Phase %s%s
101*constraints2
8 2default:default2+
Post Processing Netlist2default:defaultZ18-101h px� 
�
9Pulled %s inverters resulting in an inversion of %s pins
779*opt2
12default:default2
12default:defaultZ31-1566h px� 
b
%s*common2I
5Phase 8 Post Processing Netlist | Checksum: f8a38b6b
2default:defaulth px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:19 ; elapsed = 00:01:36 . Memory (MB): peak = 3953.797 ; gain = 49.0942default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2+
Post Processing Netlist2default:default2
02default:default2
12default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2+
Post Processing Netlist2default:default2
1582default:defaultZ31-1021h px� 
/
Opt_design Change Summary
*commonh px� 
/
=========================
*commonh px� 


*commonh px� 


*commonh px� 
�
z-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Phase                        |  #Cells created  |  #Cells Removed  |  #Constrained objects preventing optimizations  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Retarget                     |             228  |             354  |                                             67  |
|  Constant propagation         |             509  |            1194  |                                             65  |
|  Sweep                        |               1  |             191  |                                           1992  |
|  BUFG optimization            |               1  |               2  |                                              0  |
|  Shift Register Optimization  |               0  |               0  |                                              0  |
|  Post Processing Netlist      |               0  |               1  |                                            158  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.033 . Memory (MB): peak = 3953.797 ; gain = 0.0002default:defaulth px� 
a
%s*common2H
4Ending Logic Optimization Task | Checksum: c6ee6b07
2default:defaulth px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:19 ; elapsed = 00:01:36 . Memory (MB): peak = 3953.797 ; gain = 49.0942default:defaulth px� 
a

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103h px� 
s
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.002default:defaultZ34-132h px� 
�
$Power model is not available for %s
23*power2�
xiphy_riu_or	�u_ddr4_0/inst/u_ddr4_mem_intfc/u_mig_ddr4_phy/inst/generate_block1.u_ddr_xiphy/byte_num[0].xiphy_byte_wrapper.u_xiphy_byte_wrapper/u_xiphy_riuor/xiphy_riu_or2default:default8Z33-23h px� 
�
$Power model is not available for %s
23*power2�
genVref.u_hpio_vref	ju_ddr4_0/inst/u_ddr4_mem_intfc/u_mig_ddr4_phy/inst/u_ddr_iob/genByte[0].u_ddr_iob_byte/genVref.u_hpio_vref2default:default8Z33-23h px� 
=
Applying IDT optimizations ...
9*pwroptZ34-9h px� 
?
Applying ODC optimizations ...
10*pwroptZ34-10h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 


*pwropth px� 
e

Starting %s Task
103*constraints2*
PowerOpt Patch Enables2default:defaultZ18-103h px� 
�
�WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
02default:default2
262default:defaultZ34-162h px� 
d
+Structural ODC has moved %s WE to EN ports
155*pwropt2
02default:defaultZ34-201h px� 
�
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
02default:default2
02default:default2
522default:defaultZ34-65h px� 
e
%s*common2L
8Ending PowerOpt Patch Enables Task | Checksum: c6ee6b07
2default:defaulth px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.241 . Memory (MB): peak = 4208.934 ; gain = 0.0002default:defaulth px� 
a
%s*common2H
4Ending Power Optimization Task | Checksum: c6ee6b07
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:11 ; elapsed = 00:00:08 . Memory (MB): peak = 4208.934 ; gain = 255.1372default:defaulth px� 
\

Starting %s Task
103*constraints2!
Final Cleanup2default:defaultZ18-103h px� 
\
%s*common2C
/Ending Final Cleanup Task | Checksum: c6ee6b07
2default:defaulth px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.007 . Memory (MB): peak = 4208.934 ; gain = 0.0002default:defaulth px� 
b

Starting %s Task
103*constraints2'
Netlist Obfuscation2default:defaultZ18-103h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0102default:default2
4208.9342default:default2
0.0002default:defaultZ17-268h px� 
b
%s*common2I
5Ending Netlist Obfuscation Task | Checksum: c6ee6b07
2default:defaulth px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.017 . Memory (MB): peak = 4208.934 ; gain = 0.0002default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
542default:default2
182default:default2
02default:default2
02default:defaultZ4-41h px� 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
opt_design: 2default:default2
00:00:402default:default2
00:01:532default:default2
4208.9342default:default2
1035.7892default:defaultZ17-268h px� 
�
%s4*runtcl2�
sExecuting : report_drc -file example_top_drc_opted.rpt -pb example_top_drc_opted.pb -rpx example_top_drc_opted.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2z
freport_drc -file example_top_drc_opted.rpt -pb example_top_drc_opted.pb -rpx example_top_drc_opted.rpx2default:defaultZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
586*	vivadotcl2�
KD:/VIVADO231/ku5p/ddr4_0_ex/ddr4_0_ex.runs/impl_1/example_top_drc_opted.rptKD:/VIVADO231/ku5p/ddr4_0_ex/ddr4_0_ex.runs/impl_1/example_top_drc_opted.rpt2default:default8Z2-168h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:012default:default2 
00:00:00.2102default:default2
4208.9342default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2Y
ED:/VIVADO231/ku5p/ddr4_0_ex/ddr4_0_ex.runs/impl_1/example_top_opt.dcp2default:defaultZ17-1381h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:082default:default2
00:00:062default:default2
4208.9342default:default2
0.0002default:defaultZ17-268h px� 


End Record