// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:pcie4_uscale_plus:1.3
// IP Revision: 22

(* X_CORE_INFO = "design_1_xdma_0_0_pcie4_ip_pcie4_uscale_core_top,Vivado 2023.1" *)
(* CHECK_LICENSE_TYPE = "design_1_xdma_0_0_pcie4_ip,design_1_xdma_0_0_pcie4_ip_pcie4_uscale_core_top,{}" *)
(* CORE_GENERATION_INFO = "design_1_xdma_0_0_pcie4_ip,design_1_xdma_0_0_pcie4_ip_pcie4_uscale_core_top,{x_ipProduct=Vivado 2023.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=pcie4_uscale_plus,x_ipVersion=1.3,x_ipCoreRevision=22,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,PL_LINK_CAP_MAX_LINK_SPEED=4,PL_LINK_CAP_MAX_LINK_WIDTH=4,CRM_USER_CLK_FREQ=2,CRM_CORE_CLK_FREQ_500=FALSE,PLL_TYPE=2,PF0_LINK_CAP_ASPM_SUPPORT=0,AXI4_DATA_WIDTH=128,PHY_REFCLK_FREQ=0,AXI4_TKEEP_WIDTH=4,AXI4_RQ_TUSER_WIDTH=62,AXI4_CQ_TUSER_WIDTH=88,AXI4_R\
C_TUSER_WIDTH=75,AXI4_CC_TUSER_WIDTH=33,ARI_CAP_ENABLE=FALSE,PF0_ARI_CAP_NEXT_FUNC=0x04,PF1_ARI_CAP_NEXT_FUNC=0x04,PF2_ARI_CAP_NEXT_FUNC=0x04,PF3_ARI_CAP_NEXT_FUNC=0x04,AXISTEN_IF_CC_ALIGNMENT_MODE=0x1,AXISTEN_IF_CQ_ALIGNMENT_MODE=0x1,AXISTEN_IF_RC_ALIGNMENT_MODE=0x0,AXISTEN_IF_RQ_ALIGNMENT_MODE=0x0,AXISTEN_IF_EXT_512_CQ_STRADDLE=FALSE,AXISTEN_IF_EXT_512_CC_STRADDLE=FALSE,AXISTEN_IF_EXT_512_RQ_STRADDLE=FALSE,AXISTEN_IF_EXT_512_RC_STRADDLE=FALSE,AXISTEN_IF_EXT_512_RC_4TLP_STRADDLE=FALSE,AXISTEN_I\
F_RC_STRADDLE=FALSE,PF0_AER_CAP_ECRC_GEN_AND_CHECK_CAPABLE=FALSE,PF0_AER_CAP_NEXTPTR=0x1C0,PF0_PCIE_CAP_NEXTPTR=0x000,PF1_PCIE_CAP_NEXTPTR=0x000,PF2_PCIE_CAP_NEXTPTR=0x000,PF3_PCIE_CAP_NEXTPTR=0x000,VF0_EXT_PCIE_CFG_SPACE_ENABLED_NEXTPTR=0x000,VF1_EXT_PCIE_CFG_SPACE_ENABLED_NEXTPTR=0x000,VF2_EXT_PCIE_CFG_SPACE_ENABLED_NEXTPTR=0x000,VF3_EXT_PCIE_CFG_SPACE_ENABLED_NEXTPTR=0x000,PF0_ARI_CAP_NEXTPTR=0x1C0,PF0_BAR0_APERTURE_SIZE=0x009,PF0_BAR0_CONTROL=0x4,PF0_BAR1_APERTURE_SIZE=0x000,PF0_BAR1_CONTROL\
=0x0,PF0_BAR2_APERTURE_SIZE=0x000,PF0_BAR2_CONTROL=0x0,PF0_BAR3_APERTURE_SIZE=0x000,PF0_BAR3_CONTROL=0x0,PF0_BAR4_APERTURE_SIZE=0x000,PF0_BAR4_CONTROL=0x0,PF0_BAR5_APERTURE_SIZE=0x000,PF0_BAR5_CONTROL=0x0,PF0_CAPABILITY_POINTER=0x40,PF0_CLASS_CODE=0x070001,PF0_VENDOR_ID=0x10EE,PF0_DEVICE_ID=0x9034,PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT=FALSE,PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT=FALSE,PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT=FALSE,PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT=FALSE,PF0_DEV_CAP\
_EXT_TAG_SUPPORTED=TRUE,PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE=FALSE,PF0_DEV_CAP_MAX_PAYLOAD_SIZE=0x3,DSN_CAP_ENABLE=FALSE,PF0_VC_CAP_ENABLE=FALSE,PF0_DSN_CAP_NEXTPTR=0x1C0,PF0_EXPANSION_ROM_APERTURE_SIZE=0x000,PF0_EXPANSION_ROM_ENABLE=FALSE,PF0_INTERRUPT_PIN=0x1,PF0_LINK_STATUS_SLOT_CLOCK_CONFIG=TRUE,PF0_MSIX_CAP_NEXTPTR=0x70,PF0_MSIX_CAP_PBA_BIR=0,PF0_MSIX_CAP_PBA_OFFSET=0x00000000,PF0_MSIX_CAP_TABLE_BIR=0,PF0_MSIX_CAP_TABLE_OFFSET=0x00000000,PF0_MSIX_CAP_TABLE_SIZE=0x000,PF0_MSI_CAP_MULTIMS\
GCAP=0,PF0_MSI_CAP_NEXTPTR=0x70,PF0_PM_CAP_NEXTPTR=0x48,PF0_PM_CAP_PMESUPPORT_D0=FALSE,PF0_PM_CAP_PMESUPPORT_D1=FALSE,PF0_PM_CAP_PMESUPPORT_D3HOT=FALSE,PF0_PM_CAP_SUPP_D1_STATE=FALSE,PF0_REVISION_ID=0x00,PF0_SRIOV_BAR0_APERTURE_SIZE=0x00,PF0_SRIOV_BAR0_CONTROL=0x0,PF0_SRIOV_BAR1_APERTURE_SIZE=0x00,PF0_SRIOV_BAR1_CONTROL=0x0,PF0_SRIOV_BAR2_APERTURE_SIZE=0x00,PF0_SRIOV_BAR2_CONTROL=0x0,PF0_SRIOV_BAR3_APERTURE_SIZE=0x00,PF0_SRIOV_BAR3_CONTROL=0x0,PF0_SRIOV_BAR4_APERTURE_SIZE=0x00,PF0_SRIOV_BAR4_CON\
TROL=0x0,PF0_SRIOV_BAR5_APERTURE_SIZE=0x00,PF0_SRIOV_BAR5_CONTROL=0x0,PF0_SRIOV_CAP_INITIAL_VF=0x0000,PF0_SRIOV_CAP_NEXTPTR=0x000,PF0_SRIOV_CAP_TOTAL_VF=0x0000,PF0_SRIOV_CAP_VER=0x1,PF0_SRIOV_FIRST_VF_OFFSET=0x0000,PF0_SRIOV_FUNC_DEP_LINK=0x0000,PF0_SRIOV_SUPPORTED_PAGE_SIZE=0x00000553,PF0_SRIOV_VF_DEVICE_ID=0x0000,PF0_SUBSYSTEM_VENDOR_ID=0x10EE,PF0_SUBSYSTEM_ID=0x0007,PF0_TPHR_CAP_ENABLE=FALSE,PF0_TPHR_CAP_NEXTPTR=0x000,PF0_TPHR_CAP_ST_MODE_SEL=0x0,PF0_TPHR_CAP_ST_TABLE_LOC=0x0,PF0_TPHR_CAP_ST_\
TABLE_SIZE=0x000,PF0_TPHR_CAP_VER=0x1,PF1_TPHR_CAP_ST_MODE_SEL=0x0,PF2_TPHR_CAP_ST_MODE_SEL=0x0,PF3_TPHR_CAP_ST_MODE_SEL=0x0,PF0_TPHR_CAP_DEV_SPECIFIC_MODE=TRUE,PF0_TPHR_CAP_INT_VEC_MODE=FALSE,PF0_SECONDARY_PCIE_CAP_NEXTPTR=0x000,MCAP_CAP_NEXTPTR=0x000,PF0_VC_CAP_NEXTPTR=0x000,SPARE_WORD1=0x00000000,PF1_AER_CAP_NEXTPTR=0x000,PF1_ARI_CAP_NEXTPTR=0x000,PF1_BAR0_APERTURE_SIZE=0x009,PF1_BAR0_CONTROL=0x4,PF1_BAR1_APERTURE_SIZE=0x000,PF1_BAR1_CONTROL=0x0,PF1_BAR2_APERTURE_SIZE=0x000,PF1_BAR2_CONTROL=0\
x0,PF1_BAR3_APERTURE_SIZE=0x000,PF1_BAR3_CONTROL=0x0,PF1_BAR4_APERTURE_SIZE=0x000,PF1_BAR4_CONTROL=0x0,PF1_BAR5_APERTURE_SIZE=0x000,PF1_BAR5_CONTROL=0x0,PF1_CAPABILITY_POINTER=0x40,PF1_CLASS_CODE=0x058000,PF1_DEVICE_ID=0x9011,PF1_DEV_CAP_MAX_PAYLOAD_SIZE=0x3,PF1_DSN_CAP_NEXTPTR=0x000,PF1_EXPANSION_ROM_APERTURE_SIZE=0x000,PF1_EXPANSION_ROM_ENABLE=FALSE,PF1_INTERRUPT_PIN=0x0,PF1_MSIX_CAP_NEXTPTR=0x70,PF1_MSIX_CAP_PBA_BIR=0,PF1_MSIX_CAP_PBA_OFFSET=0x00000000,PF1_MSIX_CAP_TABLE_BIR=0,PF1_MSIX_CAP_TA\
BLE_OFFSET=0x00000000,PF1_MSIX_CAP_TABLE_SIZE=0x000,PF1_MSI_CAP_MULTIMSGCAP=0,PF1_MSI_CAP_NEXTPTR=0x70,PF1_PM_CAP_NEXTPTR=0x70,PF1_REVISION_ID=0x00,PF1_SRIOV_BAR0_APERTURE_SIZE=0x00,PF1_SRIOV_BAR0_CONTROL=0x0,PF1_SRIOV_BAR1_APERTURE_SIZE=0x00,PF1_SRIOV_BAR1_CONTROL=0x0,PF1_SRIOV_BAR2_APERTURE_SIZE=0x00,PF1_SRIOV_BAR2_CONTROL=0x0,PF1_SRIOV_BAR3_APERTURE_SIZE=0x00,PF1_SRIOV_BAR3_CONTROL=0x0,PF1_SRIOV_BAR4_APERTURE_SIZE=0x00,PF1_SRIOV_BAR4_CONTROL=0x0,PF1_SRIOV_BAR5_APERTURE_SIZE=0x00,PF1_SRIOV_BAR\
5_CONTROL=0x0,PF1_SRIOV_CAP_INITIAL_VF=0x0000,PF1_SRIOV_CAP_NEXTPTR=0x000,PF1_SRIOV_CAP_TOTAL_VF=0x0000,PF1_SRIOV_CAP_VER=0x1,PF1_SRIOV_FIRST_VF_OFFSET=0x0000,PF1_SRIOV_FUNC_DEP_LINK=0x0001,PF1_SRIOV_SUPPORTED_PAGE_SIZE=0x00000553,PF1_SRIOV_VF_DEVICE_ID=0x0000,PF1_SUBSYSTEM_ID=0x0007,PF1_TPHR_CAP_NEXTPTR=0x000,PF2_AER_CAP_NEXTPTR=0x000,PF2_ARI_CAP_NEXTPTR=0x000,PF2_BAR0_APERTURE_SIZE=0x009,PF2_BAR0_CONTROL=0x4,PF2_BAR1_APERTURE_SIZE=0x000,PF2_BAR1_CONTROL=0x0,PF2_BAR2_APERTURE_SIZE=0x000,PF2_BAR\
2_CONTROL=0x0,PF2_BAR3_APERTURE_SIZE=0x000,PF2_BAR3_CONTROL=0x0,PF2_BAR4_APERTURE_SIZE=0x000,PF2_BAR4_CONTROL=0x0,PF2_BAR5_APERTURE_SIZE=0x000,PF2_BAR5_CONTROL=0x0,PF2_CAPABILITY_POINTER=0x40,PF2_CLASS_CODE=0x058000,PF2_DEVICE_ID=0x9434,PF2_DEV_CAP_MAX_PAYLOAD_SIZE=0x3,PF2_DSN_CAP_NEXTPTR=0x000,PF2_EXPANSION_ROM_APERTURE_SIZE=0x000,PF2_EXPANSION_ROM_ENABLE=FALSE,PF2_INTERRUPT_PIN=0x0,PF2_MSIX_CAP_NEXTPTR=0x70,PF2_MSIX_CAP_PBA_BIR=0,PF2_MSIX_CAP_PBA_OFFSET=0x00000000,PF2_MSIX_CAP_TABLE_BIR=0,PF2_\
MSIX_CAP_TABLE_OFFSET=0x00000000,PF2_MSIX_CAP_TABLE_SIZE=0x000,PF2_MSI_CAP_MULTIMSGCAP=0,PF2_MSI_CAP_NEXTPTR=0x70,PF2_PM_CAP_NEXTPTR=0x70,PF2_REVISION_ID=0x00,PF2_SRIOV_BAR0_APERTURE_SIZE=0x00,PF2_SRIOV_BAR0_CONTROL=0x0,PF2_SRIOV_BAR1_APERTURE_SIZE=0x00,PF2_SRIOV_BAR1_CONTROL=0x0,PF2_SRIOV_BAR2_APERTURE_SIZE=0x00,PF2_SRIOV_BAR2_CONTROL=0x0,PF2_SRIOV_BAR3_APERTURE_SIZE=0x00,PF2_SRIOV_BAR3_CONTROL=0x0,PF2_SRIOV_BAR4_APERTURE_SIZE=0x00,PF2_SRIOV_BAR4_CONTROL=0x0,PF2_SRIOV_BAR5_APERTURE_SIZE=0x00,PF\
2_SRIOV_BAR5_CONTROL=0x0,PF2_SRIOV_CAP_INITIAL_VF=0x0000,PF2_SRIOV_CAP_NEXTPTR=0x000,PF2_SRIOV_CAP_TOTAL_VF=0x0000,PF2_SRIOV_CAP_VER=0x1,PF2_SRIOV_FIRST_VF_OFFSET=0x0000,PF2_SRIOV_FUNC_DEP_LINK=0x0002,PF2_SRIOV_SUPPORTED_PAGE_SIZE=0x00000553,PF2_SRIOV_VF_DEVICE_ID=0x0000,PF2_SUBSYSTEM_ID=0x0007,PF2_TPHR_CAP_NEXTPTR=0x000,PF3_AER_CAP_NEXTPTR=0x000,PF3_ARI_CAP_NEXTPTR=0x000,PF3_BAR0_APERTURE_SIZE=0x009,PF3_BAR0_CONTROL=0x4,PF3_BAR1_APERTURE_SIZE=0x000,PF3_BAR1_CONTROL=0x0,PF3_BAR2_APERTURE_SIZE=0x\
000,PF3_BAR2_CONTROL=0x0,PF3_BAR3_APERTURE_SIZE=0x000,PF3_BAR3_CONTROL=0x0,PF3_BAR4_APERTURE_SIZE=0x000,PF3_BAR4_CONTROL=0x0,PF3_BAR5_APERTURE_SIZE=0x000,PF3_BAR5_CONTROL=0x0,PF3_CAPABILITY_POINTER=0x40,PF3_CLASS_CODE=0x058000,PF3_DEVICE_ID=0x9634,PF3_DEV_CAP_MAX_PAYLOAD_SIZE=0x3,PF3_DSN_CAP_NEXTPTR=0x000,PF3_EXPANSION_ROM_APERTURE_SIZE=0x000,PF3_EXPANSION_ROM_ENABLE=FALSE,PF3_INTERRUPT_PIN=0x0,PF3_MSIX_CAP_NEXTPTR=0x70,PF3_MSIX_CAP_PBA_BIR=0,PF3_MSIX_CAP_PBA_OFFSET=0x00000000,PF3_MSIX_CAP_TABLE\
_BIR=0,PF3_MSIX_CAP_TABLE_OFFSET=0x00000000,PF3_MSIX_CAP_TABLE_SIZE=0x000,PF3_MSI_CAP_MULTIMSGCAP=0,PF3_MSI_CAP_NEXTPTR=0x70,PF3_PM_CAP_NEXTPTR=0x70,PF3_REVISION_ID=0x00,PF3_SRIOV_BAR0_APERTURE_SIZE=0x00,PF3_SRIOV_BAR0_CONTROL=0x0,PF3_SRIOV_BAR1_APERTURE_SIZE=0x00,PF3_SRIOV_BAR1_CONTROL=0x0,PF3_SRIOV_BAR2_APERTURE_SIZE=0x00,PF3_SRIOV_BAR2_CONTROL=0x0,PF3_SRIOV_BAR3_APERTURE_SIZE=0x00,PF3_SRIOV_BAR3_CONTROL=0x0,PF3_SRIOV_BAR4_APERTURE_SIZE=0x00,PF3_SRIOV_BAR4_CONTROL=0x0,PF3_SRIOV_BAR5_APERTURE_S\
IZE=0x00,PF3_SRIOV_BAR5_CONTROL=0x0,PF3_SRIOV_CAP_INITIAL_VF=0x0000,PF3_SRIOV_CAP_NEXTPTR=0x000,PF3_SRIOV_CAP_TOTAL_VF=0x0000,PF3_SRIOV_CAP_VER=0x1,PF3_SRIOV_FIRST_VF_OFFSET=0x0000,PF3_SRIOV_FUNC_DEP_LINK=0x0003,PF3_SRIOV_SUPPORTED_PAGE_SIZE=0x00000553,PF3_SRIOV_VF_DEVICE_ID=0x0000,PF3_SUBSYSTEM_ID=0x0007,PF3_TPHR_CAP_NEXTPTR=0x000,PL_UPSTREAM_FACING=TRUE,PL_DISABLE_LANE_REVERSAL=TRUE,PF0_MSI_CAP_PERVECMASKCAP=FALSE,PF1_MSI_CAP_PERVECMASKCAP=FALSE,PF2_MSI_CAP_PERVECMASKCAP=FALSE,PF3_MSI_CAP_PERV\
ECMASKCAP=FALSE,SRIOV_CAP_ENABLE=0000,TL_CREDITS_CD=0x000,TL_CREDITS_CH=0x00,TL_CREDITS_NPD=0x004,TL_CREDITS_NPH=0x20,TL_CREDITS_PD=0x3E0,TL_CREDITS_PH=0x20,EXTENDED_CFG_EXTEND_INTERFACE_ENABLE=FALSE,EXT_XVC_VSEC_ENABLE=FALSE,LEGACY_CFG_EXTEND_INTERFACE_ENABLE=FALSE,ACS_EXT_CAP_ENABLE=FALSE,ACS_CAP_NEXTPTR=0x000,TL_LEGACY_MODE_ENABLE=FALSE,TL_PF_ENABLE_REG=0,VF0_CAPABILITY_POINTER=0x70,TL_COMPLETION_RAM_SIZE=0x2,gen_x0y0_xdc=1,gen_x0y1_xdc=0,gen_x0y2_xdc=0,gen_x0y3_xdc=0,gen_x0y4_xdc=0,gen_x0y5_\
xdc=0,gen_x1y0_xdc=0,gen_x1y1_xdc=0,gen_x1y2_xdc=0,gen_x1y3_xdc=0,gen_x1y4_xdc=0,gen_x1y5_xdc=0,xlnx_ref_board=0,pcie_blk_locn=0,PIPE_SIM=FALSE,AXISTEN_IF_ENABLE_CLIENT_TAG=TRUE,PCIE_FAST_CONFIG=NONE,EXT_STARTUP_PRIMITIVE=FALSE,PL_INTERFACE=FALSE,PCIE_CONFIGURATION=FALSE,CFG_STATUS_IF=TRUE,TX_FC_IF=TRUE,CFG_EXT_IF=FALSE,CFG_FC_IF=TRUE,PER_FUNC_STATUS_IF=TRUE,CFG_MGMT_IF=TRUE,RCV_MSG_IF=TRUE,CFG_TX_MSG_IF=TRUE,CFG_CTL_IF=TRUE,CFG_PM_IF=TRUE,PCIE_ID_IF=FALSE,MSI_EN=TRUE,MSIX_EN=FALSE,PCIE4_DRP=FAL\
SE,DIS_GT_WIZARD=FALSE,BMD_PIO_MODE=FALSE,SRIOV_EXD_MODE=FALSE,DBG_CHECKER=FALSE,ENABLE_IBERT=FALSE,GEN4_EIEOS_0S7=TRUE,CTRL_SKIP_MASK=TRUE,ENABLE_JTAG_DBG=FALSE,ENABLE_LTSSM_DBG=FALSE,WARM_REBOOT_SBR_FIX=FALSE,TWO_PORT_SWITCH=FALSE,TWO_PORT_CONFIG=X8G3,TRANSCEIVER_CTRL_STATUS_PORTS=FALSE,SHARED_LOGIC=1,GTWIZ_IN_CORE=1,GTCOM_IN_CORE=2,AXISTEN_IF_RX_PARITY_EN=FALSE,AXISTEN_IF_TX_PARITY_EN=FALSE,AXISTEN_IF_MSIX_RX_PARITY_EN=FALSE,LL_TX_TLP_PARITY_CHK=FALSE,LL_RX_TLP_PARITY_GEN=FALSE,TL2CFG_IF_PARI\
TY_CHK=FALSE,AXISTEN_IF_ENABLE_INTERNAL_MSIX_TABLE=FALSE,DEDICATE_PERST=TRUE,SYS_RESET_POLARITY=0,MCAP_ENABLEMENT=NONE,MCAP_FPGA_BITSTREAM_VERSION=0x00000000,EXT_CH_GT_DRP=FALSE,EN_GT_SELECTION=TRUE,SELECT_QUAD=GTY_Quad_224,silicon_revision=Beta,DEV_PORT_TYPE=0,VFG0_MSIX_CAP_PBA_BIR=0,VFG0_MSIX_CAP_PBA_OFFSET=0x00000000,VFG0_MSIX_CAP_TABLE_BIR=0,VFG0_MSIX_CAP_TABLE_OFFSET=0x00000000,VFG0_MSIX_CAP_TABLE_SIZE=0x000,VFG1_MSIX_CAP_PBA_BIR=0,VFG1_MSIX_CAP_PBA_OFFSET=0x00000000,VFG1_MSIX_CAP_TABLE_BIR\
=0,VFG1_MSIX_CAP_TABLE_OFFSET=0x00000000,VFG1_MSIX_CAP_TABLE_SIZE=0x000,VFG2_MSIX_CAP_PBA_BIR=0,VFG2_MSIX_CAP_PBA_OFFSET=0x00000000,VFG2_MSIX_CAP_TABLE_BIR=0,VFG2_MSIX_CAP_TABLE_OFFSET=0x00000000,VFG2_MSIX_CAP_TABLE_SIZE=0x000,VFG3_MSIX_CAP_PBA_BIR=0,VFG3_MSIX_CAP_PBA_OFFSET=0x00000000,VFG3_MSIX_CAP_TABLE_BIR=0,VFG3_MSIX_CAP_TABLE_OFFSET=0x00000000,VFG3_MSIX_CAP_TABLE_SIZE=0x000,EN_PARITY=FALSE,INS_LOSS_PROFILE=ADD-IN_CARD,MSI_X_OPTIONS=None,COMPLETER_MODEL=FALSE,DBG_DESCRAMBLE_EN=FALSE,MSI_INT=\
32,VU9P_BOARD=FALSE,PHY_LP_TXPRESET=4,IS_BOARD_PROJECT=0,GT_DRP_CLK_SRC=0,FREE_RUN_FREQ=0,PM_ENABLE_L23_ENTRY=FALSE,AWS_MODE_VALUE=0,MULT_PF_DES=TRUE,EXT_SYS_CLK_BUFG=FALSE,AXISTEN_IF_ENABLE_MSG_ROUTE=0x20000,AXISTEN_IF_ENABLE_RX_MSG_INTFC=FALSE,ENABLE_MORE=FALSE,DISABLE_BRAM_PIPELINE=FALSE,DISABLE_EQ_SYNCHRONIZER=FALSE,ENABLE_AUTO_RXEQ=FALSE,THREE_PORT_SWITCH=FALSE,ENABLE_MULTIPF_AER=FALSE,ENABLE_MSIX_32VEC=FALSE,ENABLE_CLKMUX=FALSE,RBAR_ENABLE=FALSE,PF0_RBAR_CAP_BAR0_UPPER=0x0000,PF0_RBAR_CAP_\
BAR0_LOWER=0x0000FFF0,PF0_RBAR_CAP_BAR1_UPPER=0x0000,PF0_RBAR_CAP_BAR1_LOWER=0x00000000,PF0_RBAR_CAP_BAR2_UPPER=0x0000,PF0_RBAR_CAP_BAR2_LOWER=0x00000000,PF0_RBAR_CAP_BAR3_UPPER=0x0000,PF0_RBAR_CAP_BAR3_LOWER=0x00000000,PF0_RBAR_CAP_BAR4_UPPER=0x0000,PF0_RBAR_CAP_BAR4_LOWER=0x00000000,PF0_RBAR_CAP_BAR5_UPPER=0x0000,PF0_RBAR_CAP_BAR5_LOWER=0x00000000,PF1_RBAR_CAP_BAR0_UPPER=0x0000,PF1_RBAR_CAP_BAR0_LOWER=0x0000FFF0,PF1_RBAR_CAP_BAR1_UPPER=0x0000,PF1_RBAR_CAP_BAR1_LOWER=0x00000000,PF1_RBAR_CAP_BAR\
2_UPPER=0x0000,PF1_RBAR_CAP_BAR2_LOWER=0x00000000,PF1_RBAR_CAP_BAR3_UPPER=0x0000,PF1_RBAR_CAP_BAR3_LOWER=0x00000000,PF1_RBAR_CAP_BAR4_UPPER=0x0000,PF1_RBAR_CAP_BAR4_LOWER=0x00000000,PF1_RBAR_CAP_BAR5_UPPER=0x0000,PF1_RBAR_CAP_BAR5_LOWER=0x00000000,PF2_RBAR_CAP_BAR0_UPPER=0x0000,PF2_RBAR_CAP_BAR0_LOWER=0x0000FFF0,PF2_RBAR_CAP_BAR1_UPPER=0x0000,PF2_RBAR_CAP_BAR1_LOWER=0x00000000,PF2_RBAR_CAP_BAR2_UPPER=0x0000,PF2_RBAR_CAP_BAR2_LOWER=0x00000000,PF2_RBAR_CAP_BAR3_UPPER=0x0000,PF2_RBAR_CAP_BAR3_LOWER\
=0x00000000,PF2_RBAR_CAP_BAR4_UPPER=0x0000,PF2_RBAR_CAP_BAR4_LOWER=0x00000000,PF2_RBAR_CAP_BAR5_UPPER=0x0000,PF2_RBAR_CAP_BAR5_LOWER=0x00000000,PF3_RBAR_CAP_BAR0_UPPER=0x0000,PF3_RBAR_CAP_BAR0_LOWER=0x0000FFF0,PF3_RBAR_CAP_BAR1_UPPER=0x0000,PF3_RBAR_CAP_BAR1_LOWER=0x00000000,PF3_RBAR_CAP_BAR2_UPPER=0x0000,PF3_RBAR_CAP_BAR2_LOWER=0x00000000,PF3_RBAR_CAP_BAR3_UPPER=0x0000,PF3_RBAR_CAP_BAR3_LOWER=0x00000000,PF3_RBAR_CAP_BAR4_UPPER=0x0000,PF3_RBAR_CAP_BAR4_LOWER=0x00000000,PF3_RBAR_CAP_BAR5_UPPER=0x\
0000,PF3_RBAR_CAP_BAR5_LOWER=0x00000000,RBAR_CAP_NEXTPTR=0x000,PF0_RBAR_NUM_BAR=0x1,PF1_RBAR_NUM_BAR=0x1,PF2_RBAR_NUM_BAR=0x1,PF3_RBAR_NUM_BAR=0x1,PF0_RBAR_BAR_INDEX_0=0x0,PF0_RBAR_BAR_INDEX_1=0x7,PF0_RBAR_BAR_INDEX_2=0x7,PF0_RBAR_BAR_INDEX_3=0x7,PF0_RBAR_BAR_INDEX_4=0x7,PF0_RBAR_BAR_INDEX_5=0x7,PF1_RBAR_BAR_INDEX_0=0x0,PF1_RBAR_BAR_INDEX_1=0x7,PF1_RBAR_BAR_INDEX_2=0x7,PF1_RBAR_BAR_INDEX_3=0x7,PF1_RBAR_BAR_INDEX_4=0x7,PF1_RBAR_BAR_INDEX_5=0x7,PF2_RBAR_BAR_INDEX_0=0x0,PF2_RBAR_BAR_INDEX_1=0x7,PF2\
_RBAR_BAR_INDEX_2=0x7,PF2_RBAR_BAR_INDEX_3=0x7,PF2_RBAR_BAR_INDEX_4=0x7,PF2_RBAR_BAR_INDEX_5=0x7,PF3_RBAR_BAR_INDEX_0=0x0,PF3_RBAR_BAR_INDEX_1=0x7,PF3_RBAR_BAR_INDEX_2=0x7,PF3_RBAR_BAR_INDEX_3=0x7,PF3_RBAR_BAR_INDEX_4=0x7,PF3_RBAR_BAR_INDEX_5=0x7,USE_STANDARD_INTERFACES=FALSE,DMA_2RP=FALSE,SRIOV_ACTIVE_VFS=252,MASTER_GT_QUAD_INX=3,MASTER_GT_CONTAINER=0,QDMA_TPH_MSIX_BRAMS_DIS=FALSE,EN_SLOT_CAP_REG=FALSE,SLOT_CAP_REG=0x00000040,TANDEM_RFSOC=FALSE}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_xdma_0_0_pcie4_ip (
  pci_exp_txn,
  pci_exp_txp,
  pci_exp_rxn,
  pci_exp_rxp,
  user_clk,
  user_reset,
  user_lnk_up,
  s_axis_rq_tdata,
  s_axis_rq_tkeep,
  s_axis_rq_tlast,
  s_axis_rq_tready,
  s_axis_rq_tuser,
  s_axis_rq_tvalid,
  m_axis_rc_tdata,
  m_axis_rc_tkeep,
  m_axis_rc_tlast,
  m_axis_rc_tready,
  m_axis_rc_tuser,
  m_axis_rc_tvalid,
  m_axis_cq_tdata,
  m_axis_cq_tkeep,
  m_axis_cq_tlast,
  m_axis_cq_tready,
  m_axis_cq_tuser,
  m_axis_cq_tvalid,
  s_axis_cc_tdata,
  s_axis_cc_tkeep,
  s_axis_cc_tlast,
  s_axis_cc_tready,
  s_axis_cc_tuser,
  s_axis_cc_tvalid,
  pcie_rq_seq_num0,
  pcie_rq_seq_num_vld0,
  pcie_rq_seq_num1,
  pcie_rq_seq_num_vld1,
  pcie_rq_tag0,
  pcie_rq_tag1,
  pcie_rq_tag_av,
  pcie_rq_tag_vld0,
  pcie_rq_tag_vld1,
  pcie_tfc_nph_av,
  pcie_tfc_npd_av,
  pcie_cq_np_req,
  pcie_cq_np_req_count,
  cfg_phy_link_down,
  cfg_phy_link_status,
  cfg_negotiated_width,
  cfg_current_speed,
  cfg_max_payload,
  cfg_max_read_req,
  cfg_function_status,
  cfg_function_power_state,
  cfg_vf_status,
  cfg_vf_power_state,
  cfg_link_power_state,
  cfg_mgmt_addr,
  cfg_mgmt_function_number,
  cfg_mgmt_write,
  cfg_mgmt_write_data,
  cfg_mgmt_byte_enable,
  cfg_mgmt_read,
  cfg_mgmt_read_data,
  cfg_mgmt_read_write_done,
  cfg_mgmt_debug_access,
  cfg_err_cor_out,
  cfg_err_nonfatal_out,
  cfg_err_fatal_out,
  cfg_local_error_valid,
  cfg_local_error_out,
  cfg_ltssm_state,
  cfg_rx_pm_state,
  cfg_tx_pm_state,
  cfg_rcb_status,
  cfg_obff_enable,
  cfg_pl_status_change,
  cfg_tph_requester_enable,
  cfg_tph_st_mode,
  cfg_vf_tph_requester_enable,
  cfg_vf_tph_st_mode,
  cfg_msg_received,
  cfg_msg_received_data,
  cfg_msg_received_type,
  cfg_msg_transmit,
  cfg_msg_transmit_type,
  cfg_msg_transmit_data,
  cfg_msg_transmit_done,
  cfg_fc_ph,
  cfg_fc_pd,
  cfg_fc_nph,
  cfg_fc_npd,
  cfg_fc_cplh,
  cfg_fc_cpld,
  cfg_fc_sel,
  cfg_dsn,
  cfg_bus_number,
  cfg_power_state_change_ack,
  cfg_power_state_change_interrupt,
  cfg_err_cor_in,
  cfg_err_uncor_in,
  cfg_flr_in_process,
  cfg_flr_done,
  cfg_vf_flr_in_process,
  cfg_vf_flr_func_num,
  cfg_vf_flr_done,
  cfg_link_training_enable,
  cfg_interrupt_int,
  cfg_interrupt_pending,
  cfg_interrupt_sent,
  cfg_interrupt_msi_enable,
  cfg_interrupt_msi_mmenable,
  cfg_interrupt_msi_mask_update,
  cfg_interrupt_msi_data,
  cfg_interrupt_msi_select,
  cfg_interrupt_msi_int,
  cfg_interrupt_msi_pending_status,
  cfg_interrupt_msi_pending_status_data_enable,
  cfg_interrupt_msi_pending_status_function_num,
  cfg_interrupt_msi_sent,
  cfg_interrupt_msi_fail,
  cfg_interrupt_msi_attr,
  cfg_interrupt_msi_tph_present,
  cfg_interrupt_msi_tph_type,
  cfg_interrupt_msi_tph_st_tag,
  cfg_interrupt_msi_function_number,
  cfg_pm_aspm_l1_entry_reject,
  cfg_pm_aspm_tx_l0s_entry_disable,
  cfg_hot_reset_out,
  cfg_config_space_enable,
  cfg_req_pm_transition_l23_ready,
  cfg_hot_reset_in,
  cfg_ds_port_number,
  cfg_ds_bus_number,
  cfg_ds_device_number,
  sys_clk,
  sys_clk_gt,
  sys_reset,
  phy_rdy_out
);

(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie4_mgt txn" *)
output wire [3 : 0] pci_exp_txn;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie4_mgt txp" *)
output wire [3 : 0] pci_exp_txp;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie4_mgt rxn" *)
input wire [3 : 0] pci_exp_rxn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcie4_mgt, BOARD.ASSOCIATED_PARAM PCIE_BOARD_INTERFACE" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie4_mgt rxp" *)
input wire [3 : 0] pci_exp_rxp;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.user_clk, ASSOCIATED_BUSIF m_axis_cq:s_axis_cc:s_axis_rq:m_axis_rc, FREQ_HZ 125000000, ASSOCIATED_RESET user_reset, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.user_clk CLK" *)
output wire user_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.user_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.user_reset RST" *)
output wire user_reset;
output wire user_lnk_up;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TDATA" *)
input wire [127 : 0] s_axis_rq_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TKEEP" *)
input wire [3 : 0] s_axis_rq_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TLAST" *)
input wire s_axis_rq_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TREADY" *)
output wire [3 : 0] s_axis_rq_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TUSER" *)
input wire [61 : 0] s_axis_rq_tuser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_rq, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 62, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TVALID" *)
input wire s_axis_rq_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TDATA" *)
output wire [127 : 0] m_axis_rc_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TKEEP" *)
output wire [3 : 0] m_axis_rc_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TLAST" *)
output wire m_axis_rc_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TREADY" *)
input wire m_axis_rc_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TUSER" *)
output wire [74 : 0] m_axis_rc_tuser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_rc, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 75, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TVALID" *)
output wire m_axis_rc_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TDATA" *)
output wire [127 : 0] m_axis_cq_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TKEEP" *)
output wire [3 : 0] m_axis_cq_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TLAST" *)
output wire m_axis_cq_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TREADY" *)
input wire m_axis_cq_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TUSER" *)
output wire [87 : 0] m_axis_cq_tuser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_cq, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 88, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TVALID" *)
output wire m_axis_cq_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TDATA" *)
input wire [127 : 0] s_axis_cc_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TKEEP" *)
input wire [3 : 0] s_axis_cc_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TLAST" *)
input wire s_axis_cc_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TREADY" *)
output wire [3 : 0] s_axis_cc_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TUSER" *)
input wire [32 : 0] s_axis_cc_tuser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_cc, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 33, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TVALID" *)
input wire s_axis_cc_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status rq_seq_num0" *)
output wire [5 : 0] pcie_rq_seq_num0;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status rq_seq_num_vld0" *)
output wire pcie_rq_seq_num_vld0;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status rq_seq_num1" *)
output wire [5 : 0] pcie_rq_seq_num1;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status rq_seq_num_vld1" *)
output wire pcie_rq_seq_num_vld1;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status rq_tag0" *)
output wire [7 : 0] pcie_rq_tag0;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status rq_tag1" *)
output wire [7 : 0] pcie_rq_tag1;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status rq_tag_av" *)
output wire [3 : 0] pcie_rq_tag_av;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status rq_tag_vld0" *)
output wire pcie_rq_tag_vld0;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status rq_tag_vld1" *)
output wire pcie_rq_tag_vld1;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_transmit_fc:1.0 pcie4_transmit_fc nph_av" *)
output wire [3 : 0] pcie_tfc_nph_av;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_transmit_fc:1.0 pcie4_transmit_fc npd_av" *)
output wire [3 : 0] pcie_tfc_npd_av;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status cq_np_req" *)
input wire [1 : 0] pcie_cq_np_req;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status cq_np_req_count" *)
output wire [5 : 0] pcie_cq_np_req_count;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status phy_link_down" *)
output wire cfg_phy_link_down;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status phy_link_status" *)
output wire [1 : 0] cfg_phy_link_status;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status negotiated_width" *)
output wire [2 : 0] cfg_negotiated_width;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status current_speed" *)
output wire [1 : 0] cfg_current_speed;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status max_payload" *)
output wire [1 : 0] cfg_max_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status max_read_req" *)
output wire [2 : 0] cfg_max_read_req;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status function_status" *)
output wire [15 : 0] cfg_function_status;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status function_power_state" *)
output wire [11 : 0] cfg_function_power_state;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status vf_status" *)
output wire [503 : 0] cfg_vf_status;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status vf_power_state" *)
output wire [755 : 0] cfg_vf_power_state;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status link_power_state" *)
output wire [1 : 0] cfg_link_power_state;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_mgmt:1.0 pcie4_cfg_mgmt ADDR" *)
input wire [9 : 0] cfg_mgmt_addr;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_mgmt:1.0 pcie4_cfg_mgmt FUNCTION_NUMBER" *)
input wire [7 : 0] cfg_mgmt_function_number;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_mgmt:1.0 pcie4_cfg_mgmt WRITE_EN" *)
input wire cfg_mgmt_write;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_mgmt:1.0 pcie4_cfg_mgmt WRITE_DATA" *)
input wire [31 : 0] cfg_mgmt_write_data;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_mgmt:1.0 pcie4_cfg_mgmt BYTE_EN" *)
input wire [3 : 0] cfg_mgmt_byte_enable;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_mgmt:1.0 pcie4_cfg_mgmt READ_EN" *)
input wire cfg_mgmt_read;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_mgmt:1.0 pcie4_cfg_mgmt READ_DATA" *)
output wire [31 : 0] cfg_mgmt_read_data;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_mgmt:1.0 pcie4_cfg_mgmt READ_WRITE_DONE" *)
output wire cfg_mgmt_read_write_done;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_mgmt:1.0 pcie4_cfg_mgmt DEBUG_ACCESS" *)
input wire cfg_mgmt_debug_access;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status err_cor_out" *)
output wire cfg_err_cor_out;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status err_nonfatal_out" *)
output wire cfg_err_nonfatal_out;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status err_fatal_out" *)
output wire cfg_err_fatal_out;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status local_error_valid" *)
output wire cfg_local_error_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status local_error_out" *)
output wire [4 : 0] cfg_local_error_out;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status ltssm_state" *)
output wire [5 : 0] cfg_ltssm_state;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status rx_pm_state" *)
output wire [1 : 0] cfg_rx_pm_state;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status tx_pm_state" *)
output wire [1 : 0] cfg_tx_pm_state;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status rcb_status" *)
output wire [3 : 0] cfg_rcb_status;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status obff_enable" *)
output wire [1 : 0] cfg_obff_enable;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status pl_status_change" *)
output wire cfg_pl_status_change;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status tph_requester_enable" *)
output wire [3 : 0] cfg_tph_requester_enable;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status tph_st_mode" *)
output wire [11 : 0] cfg_tph_st_mode;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status vf_tph_requester_enable" *)
output wire [251 : 0] cfg_vf_tph_requester_enable;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_status:1.0 pcie4_cfg_status vf_tph_st_mode" *)
output wire [755 : 0] cfg_vf_tph_st_mode;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msg_received:1.0 pcie4_cfg_mesg_rcvd recd" *)
output wire cfg_msg_received;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msg_received:1.0 pcie4_cfg_mesg_rcvd recd_data" *)
output wire [7 : 0] cfg_msg_received_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msg_received:1.0 pcie4_cfg_mesg_rcvd recd_type" *)
output wire [4 : 0] cfg_msg_received_type;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_mesg_tx:1.0 pcie4_cfg_mesg_tx TRANSMIT" *)
input wire cfg_msg_transmit;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_mesg_tx:1.0 pcie4_cfg_mesg_tx TRANSMIT_TYPE" *)
input wire [2 : 0] cfg_msg_transmit_type;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_mesg_tx:1.0 pcie4_cfg_mesg_tx TRANSMIT_DATA" *)
input wire [31 : 0] cfg_msg_transmit_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_mesg_tx:1.0 pcie4_cfg_mesg_tx TRANSMIT_DONE" *)
output wire cfg_msg_transmit_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie4_cfg_fc PH" *)
output wire [7 : 0] cfg_fc_ph;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie4_cfg_fc PD" *)
output wire [11 : 0] cfg_fc_pd;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie4_cfg_fc NPH" *)
output wire [7 : 0] cfg_fc_nph;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie4_cfg_fc NPD" *)
output wire [11 : 0] cfg_fc_npd;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie4_cfg_fc CPLH" *)
output wire [7 : 0] cfg_fc_cplh;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie4_cfg_fc CPLD" *)
output wire [11 : 0] cfg_fc_cpld;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie4_cfg_fc SEL" *)
input wire [2 : 0] cfg_fc_sel;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control dsn" *)
input wire [63 : 0] cfg_dsn;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control bus_number" *)
output wire [7 : 0] cfg_bus_number;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control power_state_change_ack" *)
input wire cfg_power_state_change_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control power_state_change_interrupt" *)
output wire cfg_power_state_change_interrupt;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control err_cor_in" *)
input wire cfg_err_cor_in;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control err_uncor_in" *)
input wire cfg_err_uncor_in;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control flr_in_process" *)
output wire [3 : 0] cfg_flr_in_process;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control flr_done" *)
input wire [3 : 0] cfg_flr_done;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control vf_flr_in_process" *)
output wire [251 : 0] cfg_vf_flr_in_process;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control vf_flr_func_num" *)
input wire [7 : 0] cfg_vf_flr_func_num;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control vf_flr_done" *)
input wire [0 : 0] cfg_vf_flr_done;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control link_training_enable" *)
input wire cfg_link_training_enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_interrupt:1.0 pcie4_cfg_interrupt INTx_VECTOR" *)
input wire [3 : 0] cfg_interrupt_int;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_interrupt:1.0 pcie4_cfg_interrupt PENDING" *)
input wire [3 : 0] cfg_interrupt_pending;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_interrupt:1.0 pcie4_cfg_interrupt SENT" *)
output wire cfg_interrupt_sent;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi enable" *)
output wire [3 : 0] cfg_interrupt_msi_enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi mmenable" *)
output wire [11 : 0] cfg_interrupt_msi_mmenable;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi mask_update" *)
output wire cfg_interrupt_msi_mask_update;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi data" *)
output wire [31 : 0] cfg_interrupt_msi_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi select" *)
input wire [1 : 0] cfg_interrupt_msi_select;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi int_vector" *)
input wire [31 : 0] cfg_interrupt_msi_int;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi pending_status" *)
input wire [31 : 0] cfg_interrupt_msi_pending_status;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi pending_status_data_enable" *)
input wire cfg_interrupt_msi_pending_status_data_enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi pending_status_function_num" *)
input wire [1 : 0] cfg_interrupt_msi_pending_status_function_num;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi sent" *)
output wire cfg_interrupt_msi_sent;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi fail" *)
output wire cfg_interrupt_msi_fail;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi attr" *)
input wire [2 : 0] cfg_interrupt_msi_attr;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi tph_present" *)
input wire cfg_interrupt_msi_tph_present;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi tph_type" *)
input wire [1 : 0] cfg_interrupt_msi_tph_type;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi tph_st_tag" *)
input wire [7 : 0] cfg_interrupt_msi_tph_st_tag;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 pcie4_cfg_msi function_number" *)
input wire [7 : 0] cfg_interrupt_msi_function_number;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_pm:1.0 pcie4_cfg_pm pm_aspm_l1entry_reject" *)
input wire cfg_pm_aspm_l1_entry_reject;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_pm:1.0 pcie4_cfg_pm pm_aspm_tx_l0s_entry_disable" *)
input wire cfg_pm_aspm_tx_l0s_entry_disable;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control hot_reset_out" *)
output wire cfg_hot_reset_out;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control config_space_enable" *)
input wire cfg_config_space_enable;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control req_pm_transition_l23_ready" *)
input wire cfg_req_pm_transition_l23_ready;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control hot_reset_in" *)
input wire cfg_hot_reset_in;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control ds_port_number" *)
input wire [7 : 0] cfg_ds_port_number;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control ds_bus_number" *)
input wire [7 : 0] cfg_ds_bus_number;
(* X_INTERFACE_INFO = "xilinx.com:display_pcie4:pcie4_cfg_control:1.0 pcie4_cfg_control ds_device_number" *)
input wire [4 : 0] cfg_ds_device_number;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.sys_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.sys_clk CLK" *)
input wire sys_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.sys_clk_gt, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.sys_clk_gt CLK" *)
input wire sys_clk_gt;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.sys_rst, BOARD.ASSOCIATED_PARAM SYS_RST_N_BOARD_INTERFACE, TYPE PCIE_PERST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.sys_rst RST" *)
input wire sys_reset;
output wire phy_rdy_out;

  design_1_xdma_0_0_pcie4_ip_pcie4_uscale_core_top #(
    .PL_LINK_CAP_MAX_LINK_SPEED(4),
    .PL_LINK_CAP_MAX_LINK_WIDTH(4),
    .CRM_USER_CLK_FREQ(2),
    .CRM_CORE_CLK_FREQ_500("FALSE"),
    .PLL_TYPE(2),
    .PF0_LINK_CAP_ASPM_SUPPORT(0),
    .AXI4_DATA_WIDTH(128),
    .PHY_REFCLK_FREQ(0),
    .AXI4_TKEEP_WIDTH(4),
    .AXI4_RQ_TUSER_WIDTH(62),
    .AXI4_CQ_TUSER_WIDTH(88),
    .AXI4_RC_TUSER_WIDTH(75),
    .AXI4_CC_TUSER_WIDTH(33),
    .ARI_CAP_ENABLE("FALSE"),
    .PF0_ARI_CAP_NEXT_FUNC(8'H04),
    .PF1_ARI_CAP_NEXT_FUNC(8'H04),
    .PF2_ARI_CAP_NEXT_FUNC(8'H04),
    .PF3_ARI_CAP_NEXT_FUNC(8'H04),
    .AXISTEN_IF_CC_ALIGNMENT_MODE(2'H1),
    .AXISTEN_IF_CQ_ALIGNMENT_MODE(2'H1),
    .AXISTEN_IF_RC_ALIGNMENT_MODE(2'H0),
    .AXISTEN_IF_RQ_ALIGNMENT_MODE(2'H0),
    .AXISTEN_IF_EXT_512_CQ_STRADDLE("FALSE"),
    .AXISTEN_IF_EXT_512_CC_STRADDLE("FALSE"),
    .AXISTEN_IF_EXT_512_RQ_STRADDLE("FALSE"),
    .AXISTEN_IF_EXT_512_RC_STRADDLE("FALSE"),
    .AXISTEN_IF_EXT_512_RC_4TLP_STRADDLE("FALSE"),
    .AXISTEN_IF_RC_STRADDLE("FALSE"),
    .PF0_AER_CAP_ECRC_GEN_AND_CHECK_CAPABLE("FALSE"),
    .PF0_AER_CAP_NEXTPTR(12'H1C0),
    .PF0_PCIE_CAP_NEXTPTR(12'H000),
    .PF1_PCIE_CAP_NEXTPTR(12'H000),
    .PF2_PCIE_CAP_NEXTPTR(12'H000),
    .PF3_PCIE_CAP_NEXTPTR(12'H000),
    .VF0_EXT_PCIE_CFG_SPACE_ENABLED_NEXTPTR(12'H000),
    .VF1_EXT_PCIE_CFG_SPACE_ENABLED_NEXTPTR(12'H000),
    .VF2_EXT_PCIE_CFG_SPACE_ENABLED_NEXTPTR(12'H000),
    .VF3_EXT_PCIE_CFG_SPACE_ENABLED_NEXTPTR(12'H000),
    .PF0_ARI_CAP_NEXTPTR(12'H1C0),
    .PF0_BAR0_APERTURE_SIZE(9'H009),
    .PF0_BAR0_CONTROL(3'H4),
    .PF0_BAR1_APERTURE_SIZE(9'H000),
    .PF0_BAR1_CONTROL(3'H0),
    .PF0_BAR2_APERTURE_SIZE(9'H000),
    .PF0_BAR2_CONTROL(3'H0),
    .PF0_BAR3_APERTURE_SIZE(9'H000),
    .PF0_BAR3_CONTROL(3'H0),
    .PF0_BAR4_APERTURE_SIZE(9'H000),
    .PF0_BAR4_CONTROL(3'H0),
    .PF0_BAR5_APERTURE_SIZE(9'H000),
    .PF0_BAR5_CONTROL(3'H0),
    .PF0_CAPABILITY_POINTER(8'H40),
    .PF0_CLASS_CODE(24'H070001),
    .PF0_VENDOR_ID(16'H10EE),
    .PF0_DEVICE_ID(16'H9034),
    .PF0_DEV_CAP2_128B_CAS_ATOMIC_COMPLETER_SUPPORT("FALSE"),
    .PF0_DEV_CAP2_32B_ATOMIC_COMPLETER_SUPPORT("FALSE"),
    .PF0_DEV_CAP2_64B_ATOMIC_COMPLETER_SUPPORT("FALSE"),
    .PF0_DEV_CAP2_TPH_COMPLETER_SUPPORT("FALSE"),
    .PF0_DEV_CAP_EXT_TAG_SUPPORTED("TRUE"),
    .PF0_DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE("FALSE"),
    .PF0_DEV_CAP_MAX_PAYLOAD_SIZE(3'H3),
    .DSN_CAP_ENABLE("FALSE"),
    .PF0_VC_CAP_ENABLE("FALSE"),
    .PF0_DSN_CAP_NEXTPTR(12'H1C0),
    .PF0_EXPANSION_ROM_APERTURE_SIZE(9'H000),
    .PF0_EXPANSION_ROM_ENABLE("FALSE"),
    .PF0_INTERRUPT_PIN(3'H1),
    .PF0_LINK_STATUS_SLOT_CLOCK_CONFIG("TRUE"),
    .PF0_MSIX_CAP_NEXTPTR(8'H70),
    .PF0_MSIX_CAP_PBA_BIR(0),
    .PF0_MSIX_CAP_PBA_OFFSET(29'H00000000),
    .PF0_MSIX_CAP_TABLE_BIR(0),
    .PF0_MSIX_CAP_TABLE_OFFSET(29'H00000000),
    .PF0_MSIX_CAP_TABLE_SIZE(11'H000),
    .PF0_MSI_CAP_MULTIMSGCAP(0),
    .PF0_MSI_CAP_NEXTPTR(8'H70),
    .PF0_PM_CAP_NEXTPTR(8'H48),
    .PF0_PM_CAP_PMESUPPORT_D0("FALSE"),
    .PF0_PM_CAP_PMESUPPORT_D1("FALSE"),
    .PF0_PM_CAP_PMESUPPORT_D3HOT("FALSE"),
    .PF0_PM_CAP_SUPP_D1_STATE("FALSE"),
    .PF0_REVISION_ID(8'H00),
    .PF0_SRIOV_BAR0_APERTURE_SIZE(8'H00),
    .PF0_SRIOV_BAR0_CONTROL(3'H0),
    .PF0_SRIOV_BAR1_APERTURE_SIZE(8'H00),
    .PF0_SRIOV_BAR1_CONTROL(3'H0),
    .PF0_SRIOV_BAR2_APERTURE_SIZE(8'H00),
    .PF0_SRIOV_BAR2_CONTROL(3'H0),
    .PF0_SRIOV_BAR3_APERTURE_SIZE(8'H00),
    .PF0_SRIOV_BAR3_CONTROL(3'H0),
    .PF0_SRIOV_BAR4_APERTURE_SIZE(8'H00),
    .PF0_SRIOV_BAR4_CONTROL(3'H0),
    .PF0_SRIOV_BAR5_APERTURE_SIZE(8'H00),
    .PF0_SRIOV_BAR5_CONTROL(3'H0),
    .PF0_SRIOV_CAP_INITIAL_VF(16'H0000),
    .PF0_SRIOV_CAP_NEXTPTR(12'H000),
    .PF0_SRIOV_CAP_TOTAL_VF(16'H0000),
    .PF0_SRIOV_CAP_VER(4'H1),
    .PF0_SRIOV_FIRST_VF_OFFSET(16'H0000),
    .PF0_SRIOV_FUNC_DEP_LINK(16'H0000),
    .PF0_SRIOV_SUPPORTED_PAGE_SIZE(32'H00000553),
    .PF0_SRIOV_VF_DEVICE_ID(16'H0000),
    .PF0_SUBSYSTEM_VENDOR_ID(16'H10EE),
    .PF0_SUBSYSTEM_ID(16'H0007),
    .PF0_TPHR_CAP_ENABLE("FALSE"),
    .PF0_TPHR_CAP_NEXTPTR(12'H000),
    .PF0_TPHR_CAP_ST_MODE_SEL(3'H0),
    .PF0_TPHR_CAP_ST_TABLE_LOC(2'H0),
    .PF0_TPHR_CAP_ST_TABLE_SIZE(11'H000),
    .PF0_TPHR_CAP_VER(4'H1),
    .PF1_TPHR_CAP_ST_MODE_SEL(3'H0),
    .PF2_TPHR_CAP_ST_MODE_SEL(3'H0),
    .PF3_TPHR_CAP_ST_MODE_SEL(3'H0),
    .PF0_TPHR_CAP_DEV_SPECIFIC_MODE("TRUE"),
    .PF0_TPHR_CAP_INT_VEC_MODE("FALSE"),
    .PF0_SECONDARY_PCIE_CAP_NEXTPTR(12'H000),
    .MCAP_CAP_NEXTPTR(12'H000),
    .PF0_VC_CAP_NEXTPTR(12'H000),
    .SPARE_WORD1(32'H00000000),
    .PF1_AER_CAP_NEXTPTR(12'H000),
    .PF1_ARI_CAP_NEXTPTR(12'H000),
    .PF1_BAR0_APERTURE_SIZE(9'H009),
    .PF1_BAR0_CONTROL(3'H4),
    .PF1_BAR1_APERTURE_SIZE(9'H000),
    .PF1_BAR1_CONTROL(3'H0),
    .PF1_BAR2_APERTURE_SIZE(9'H000),
    .PF1_BAR2_CONTROL(3'H0),
    .PF1_BAR3_APERTURE_SIZE(9'H000),
    .PF1_BAR3_CONTROL(3'H0),
    .PF1_BAR4_APERTURE_SIZE(9'H000),
    .PF1_BAR4_CONTROL(3'H0),
    .PF1_BAR5_APERTURE_SIZE(9'H000),
    .PF1_BAR5_CONTROL(3'H0),
    .PF1_CAPABILITY_POINTER(8'H40),
    .PF1_CLASS_CODE(24'H058000),
    .PF1_DEVICE_ID(16'H9011),
    .PF1_DEV_CAP_MAX_PAYLOAD_SIZE(3'H3),
    .PF1_DSN_CAP_NEXTPTR(12'H000),
    .PF1_EXPANSION_ROM_APERTURE_SIZE(9'H000),
    .PF1_EXPANSION_ROM_ENABLE("FALSE"),
    .PF1_INTERRUPT_PIN(3'H0),
    .PF1_MSIX_CAP_NEXTPTR(8'H70),
    .PF1_MSIX_CAP_PBA_BIR(0),
    .PF1_MSIX_CAP_PBA_OFFSET(29'H00000000),
    .PF1_MSIX_CAP_TABLE_BIR(0),
    .PF1_MSIX_CAP_TABLE_OFFSET(29'H00000000),
    .PF1_MSIX_CAP_TABLE_SIZE(11'H000),
    .PF1_MSI_CAP_MULTIMSGCAP(0),
    .PF1_MSI_CAP_NEXTPTR(8'H70),
    .PF1_PM_CAP_NEXTPTR(8'H70),
    .PF1_REVISION_ID(8'H00),
    .PF1_SRIOV_BAR0_APERTURE_SIZE(8'H00),
    .PF1_SRIOV_BAR0_CONTROL(3'H0),
    .PF1_SRIOV_BAR1_APERTURE_SIZE(8'H00),
    .PF1_SRIOV_BAR1_CONTROL(3'H0),
    .PF1_SRIOV_BAR2_APERTURE_SIZE(8'H00),
    .PF1_SRIOV_BAR2_CONTROL(3'H0),
    .PF1_SRIOV_BAR3_APERTURE_SIZE(8'H00),
    .PF1_SRIOV_BAR3_CONTROL(3'H0),
    .PF1_SRIOV_BAR4_APERTURE_SIZE(8'H00),
    .PF1_SRIOV_BAR4_CONTROL(3'H0),
    .PF1_SRIOV_BAR5_APERTURE_SIZE(8'H00),
    .PF1_SRIOV_BAR5_CONTROL(3'H0),
    .PF1_SRIOV_CAP_INITIAL_VF(16'H0000),
    .PF1_SRIOV_CAP_NEXTPTR(12'H000),
    .PF1_SRIOV_CAP_TOTAL_VF(16'H0000),
    .PF1_SRIOV_CAP_VER(4'H1),
    .PF1_SRIOV_FIRST_VF_OFFSET(16'H0000),
    .PF1_SRIOV_FUNC_DEP_LINK(16'H0001),
    .PF1_SRIOV_SUPPORTED_PAGE_SIZE(32'H00000553),
    .PF1_SRIOV_VF_DEVICE_ID(16'H0000),
    .PF1_SUBSYSTEM_ID(16'H0007),
    .PF1_TPHR_CAP_NEXTPTR(12'H000),
    .PF2_AER_CAP_NEXTPTR(12'H000),
    .PF2_ARI_CAP_NEXTPTR(12'H000),
    .PF2_BAR0_APERTURE_SIZE(9'H009),
    .PF2_BAR0_CONTROL(3'H4),
    .PF2_BAR1_APERTURE_SIZE(9'H000),
    .PF2_BAR1_CONTROL(3'H0),
    .PF2_BAR2_APERTURE_SIZE(9'H000),
    .PF2_BAR2_CONTROL(3'H0),
    .PF2_BAR3_APERTURE_SIZE(9'H000),
    .PF2_BAR3_CONTROL(3'H0),
    .PF2_BAR4_APERTURE_SIZE(9'H000),
    .PF2_BAR4_CONTROL(3'H0),
    .PF2_BAR5_APERTURE_SIZE(9'H000),
    .PF2_BAR5_CONTROL(3'H0),
    .PF2_CAPABILITY_POINTER(8'H40),
    .PF2_CLASS_CODE(24'H058000),
    .PF2_DEVICE_ID(16'H9434),
    .PF2_DEV_CAP_MAX_PAYLOAD_SIZE(3'H3),
    .PF2_DSN_CAP_NEXTPTR(12'H000),
    .PF2_EXPANSION_ROM_APERTURE_SIZE(9'H000),
    .PF2_EXPANSION_ROM_ENABLE("FALSE"),
    .PF2_INTERRUPT_PIN(3'H0),
    .PF2_MSIX_CAP_NEXTPTR(8'H70),
    .PF2_MSIX_CAP_PBA_BIR(0),
    .PF2_MSIX_CAP_PBA_OFFSET(29'H00000000),
    .PF2_MSIX_CAP_TABLE_BIR(0),
    .PF2_MSIX_CAP_TABLE_OFFSET(29'H00000000),
    .PF2_MSIX_CAP_TABLE_SIZE(11'H000),
    .PF2_MSI_CAP_MULTIMSGCAP(0),
    .PF2_MSI_CAP_NEXTPTR(8'H70),
    .PF2_PM_CAP_NEXTPTR(8'H70),
    .PF2_REVISION_ID(8'H00),
    .PF2_SRIOV_BAR0_APERTURE_SIZE(8'H00),
    .PF2_SRIOV_BAR0_CONTROL(3'H0),
    .PF2_SRIOV_BAR1_APERTURE_SIZE(8'H00),
    .PF2_SRIOV_BAR1_CONTROL(3'H0),
    .PF2_SRIOV_BAR2_APERTURE_SIZE(8'H00),
    .PF2_SRIOV_BAR2_CONTROL(3'H0),
    .PF2_SRIOV_BAR3_APERTURE_SIZE(8'H00),
    .PF2_SRIOV_BAR3_CONTROL(3'H0),
    .PF2_SRIOV_BAR4_APERTURE_SIZE(8'H00),
    .PF2_SRIOV_BAR4_CONTROL(3'H0),
    .PF2_SRIOV_BAR5_APERTURE_SIZE(8'H00),
    .PF2_SRIOV_BAR5_CONTROL(3'H0),
    .PF2_SRIOV_CAP_INITIAL_VF(16'H0000),
    .PF2_SRIOV_CAP_NEXTPTR(12'H000),
    .PF2_SRIOV_CAP_TOTAL_VF(16'H0000),
    .PF2_SRIOV_CAP_VER(4'H1),
    .PF2_SRIOV_FIRST_VF_OFFSET(16'H0000),
    .PF2_SRIOV_FUNC_DEP_LINK(16'H0002),
    .PF2_SRIOV_SUPPORTED_PAGE_SIZE(32'H00000553),
    .PF2_SRIOV_VF_DEVICE_ID(16'H0000),
    .PF2_SUBSYSTEM_ID(16'H0007),
    .PF2_TPHR_CAP_NEXTPTR(12'H000),
    .PF3_AER_CAP_NEXTPTR(12'H000),
    .PF3_ARI_CAP_NEXTPTR(12'H000),
    .PF3_BAR0_APERTURE_SIZE(9'H009),
    .PF3_BAR0_CONTROL(3'H4),
    .PF3_BAR1_APERTURE_SIZE(9'H000),
    .PF3_BAR1_CONTROL(3'H0),
    .PF3_BAR2_APERTURE_SIZE(9'H000),
    .PF3_BAR2_CONTROL(3'H0),
    .PF3_BAR3_APERTURE_SIZE(9'H000),
    .PF3_BAR3_CONTROL(3'H0),
    .PF3_BAR4_APERTURE_SIZE(9'H000),
    .PF3_BAR4_CONTROL(3'H0),
    .PF3_BAR5_APERTURE_SIZE(9'H000),
    .PF3_BAR5_CONTROL(3'H0),
    .PF3_CAPABILITY_POINTER(8'H40),
    .PF3_CLASS_CODE(24'H058000),
    .PF3_DEVICE_ID(16'H9634),
    .PF3_DEV_CAP_MAX_PAYLOAD_SIZE(3'H3),
    .PF3_DSN_CAP_NEXTPTR(12'H000),
    .PF3_EXPANSION_ROM_APERTURE_SIZE(9'H000),
    .PF3_EXPANSION_ROM_ENABLE("FALSE"),
    .PF3_INTERRUPT_PIN(3'H0),
    .PF3_MSIX_CAP_NEXTPTR(8'H70),
    .PF3_MSIX_CAP_PBA_BIR(0),
    .PF3_MSIX_CAP_PBA_OFFSET(29'H00000000),
    .PF3_MSIX_CAP_TABLE_BIR(0),
    .PF3_MSIX_CAP_TABLE_OFFSET(29'H00000000),
    .PF3_MSIX_CAP_TABLE_SIZE(11'H000),
    .PF3_MSI_CAP_MULTIMSGCAP(0),
    .PF3_MSI_CAP_NEXTPTR(8'H70),
    .PF3_PM_CAP_NEXTPTR(8'H70),
    .PF3_REVISION_ID(8'H00),
    .PF3_SRIOV_BAR0_APERTURE_SIZE(8'H00),
    .PF3_SRIOV_BAR0_CONTROL(3'H0),
    .PF3_SRIOV_BAR1_APERTURE_SIZE(8'H00),
    .PF3_SRIOV_BAR1_CONTROL(3'H0),
    .PF3_SRIOV_BAR2_APERTURE_SIZE(8'H00),
    .PF3_SRIOV_BAR2_CONTROL(3'H0),
    .PF3_SRIOV_BAR3_APERTURE_SIZE(8'H00),
    .PF3_SRIOV_BAR3_CONTROL(3'H0),
    .PF3_SRIOV_BAR4_APERTURE_SIZE(8'H00),
    .PF3_SRIOV_BAR4_CONTROL(3'H0),
    .PF3_SRIOV_BAR5_APERTURE_SIZE(8'H00),
    .PF3_SRIOV_BAR5_CONTROL(3'H0),
    .PF3_SRIOV_CAP_INITIAL_VF(16'H0000),
    .PF3_SRIOV_CAP_NEXTPTR(12'H000),
    .PF3_SRIOV_CAP_TOTAL_VF(16'H0000),
    .PF3_SRIOV_CAP_VER(4'H1),
    .PF3_SRIOV_FIRST_VF_OFFSET(16'H0000),
    .PF3_SRIOV_FUNC_DEP_LINK(16'H0003),
    .PF3_SRIOV_SUPPORTED_PAGE_SIZE(32'H00000553),
    .PF3_SRIOV_VF_DEVICE_ID(16'H0000),
    .PF3_SUBSYSTEM_ID(16'H0007),
    .PF3_TPHR_CAP_NEXTPTR(12'H000),
    .PL_UPSTREAM_FACING("TRUE"),
    .PL_DISABLE_LANE_REVERSAL("TRUE"),
    .PF0_MSI_CAP_PERVECMASKCAP("FALSE"),
    .PF1_MSI_CAP_PERVECMASKCAP("FALSE"),
    .PF2_MSI_CAP_PERVECMASKCAP("FALSE"),
    .PF3_MSI_CAP_PERVECMASKCAP("FALSE"),
    .SRIOV_CAP_ENABLE(4'D0000),
    .TL_CREDITS_CD(12'H000),
    .TL_CREDITS_CH(8'H00),
    .TL_CREDITS_NPD(12'H004),
    .TL_CREDITS_NPH(8'H20),
    .TL_CREDITS_PD(12'H3E0),
    .TL_CREDITS_PH(8'H20),
    .EXTENDED_CFG_EXTEND_INTERFACE_ENABLE("FALSE"),
    .EXT_XVC_VSEC_ENABLE("FALSE"),
    .LEGACY_CFG_EXTEND_INTERFACE_ENABLE("FALSE"),
    .ACS_EXT_CAP_ENABLE("FALSE"),
    .ACS_CAP_NEXTPTR(12'H000),
    .TL_LEGACY_MODE_ENABLE("FALSE"),
    .TL_PF_ENABLE_REG(0),
    .VF0_CAPABILITY_POINTER(8'H70),
    .TL_COMPLETION_RAM_SIZE(2'H2),
    .gen_x0y0_xdc(1),
    .gen_x0y1_xdc(0),
    .gen_x0y2_xdc(0),
    .gen_x0y3_xdc(0),
    .gen_x0y4_xdc(0),
    .gen_x0y5_xdc(0),
    .gen_x1y0_xdc(0),
    .gen_x1y1_xdc(0),
    .gen_x1y2_xdc(0),
    .gen_x1y3_xdc(0),
    .gen_x1y4_xdc(0),
    .gen_x1y5_xdc(0),
    .xlnx_ref_board("0"),
    .pcie_blk_locn(0),
    .PIPE_SIM("FALSE"),
    .AXISTEN_IF_ENABLE_CLIENT_TAG("TRUE"),
    .PCIE_FAST_CONFIG("NONE"),
    .EXT_STARTUP_PRIMITIVE("FALSE"),
    .PL_INTERFACE("FALSE"),
    .PCIE_CONFIGURATION("FALSE"),
    .CFG_STATUS_IF("TRUE"),
    .TX_FC_IF("TRUE"),
    .CFG_EXT_IF("FALSE"),
    .CFG_FC_IF("TRUE"),
    .PER_FUNC_STATUS_IF("TRUE"),
    .CFG_MGMT_IF("TRUE"),
    .RCV_MSG_IF("TRUE"),
    .CFG_TX_MSG_IF("TRUE"),
    .CFG_CTL_IF("TRUE"),
    .CFG_PM_IF("TRUE"),
    .PCIE_ID_IF("FALSE"),
    .MSI_EN("TRUE"),
    .MSIX_EN("FALSE"),
    .PCIE4_DRP("FALSE"),
    .DIS_GT_WIZARD("FALSE"),
    .BMD_PIO_MODE("FALSE"),
    .SRIOV_EXD_MODE("FALSE"),
    .DBG_CHECKER("FALSE"),
    .ENABLE_IBERT("FALSE"),
    .GEN4_EIEOS_0S7("TRUE"),
    .CTRL_SKIP_MASK("TRUE"),
    .ENABLE_JTAG_DBG("FALSE"),
    .ENABLE_LTSSM_DBG("FALSE"),
    .WARM_REBOOT_SBR_FIX("FALSE"),
    .TWO_PORT_SWITCH("FALSE"),
    .TWO_PORT_CONFIG("X8G3"),
    .TRANSCEIVER_CTRL_STATUS_PORTS("FALSE"),
    .SHARED_LOGIC(1),
    .GTWIZ_IN_CORE(1),
    .GTCOM_IN_CORE(2),
    .AXISTEN_IF_RX_PARITY_EN("FALSE"),
    .AXISTEN_IF_TX_PARITY_EN("FALSE"),
    .AXISTEN_IF_MSIX_RX_PARITY_EN("FALSE"),
    .LL_TX_TLP_PARITY_CHK("FALSE"),
    .LL_RX_TLP_PARITY_GEN("FALSE"),
    .TL2CFG_IF_PARITY_CHK("FALSE"),
    .AXISTEN_IF_ENABLE_INTERNAL_MSIX_TABLE("FALSE"),
    .DEDICATE_PERST("TRUE"),
    .SYS_RESET_POLARITY(0),
    .MCAP_ENABLEMENT("NONE"),
    .MCAP_FPGA_BITSTREAM_VERSION(32'H00000000),
    .EXT_CH_GT_DRP("FALSE"),
    .EN_GT_SELECTION("TRUE"),
    .SELECT_QUAD("GTY_Quad_224"),
    .silicon_revision("Beta"),
    .DEV_PORT_TYPE(0),
    .VFG0_MSIX_CAP_PBA_BIR(0),
    .VFG0_MSIX_CAP_PBA_OFFSET(29'H00000000),
    .VFG0_MSIX_CAP_TABLE_BIR(0),
    .VFG0_MSIX_CAP_TABLE_OFFSET(29'H00000000),
    .VFG0_MSIX_CAP_TABLE_SIZE(11'H000),
    .VFG1_MSIX_CAP_PBA_BIR(0),
    .VFG1_MSIX_CAP_PBA_OFFSET(29'H00000000),
    .VFG1_MSIX_CAP_TABLE_BIR(0),
    .VFG1_MSIX_CAP_TABLE_OFFSET(29'H00000000),
    .VFG1_MSIX_CAP_TABLE_SIZE(11'H000),
    .VFG2_MSIX_CAP_PBA_BIR(0),
    .VFG2_MSIX_CAP_PBA_OFFSET(29'H00000000),
    .VFG2_MSIX_CAP_TABLE_BIR(0),
    .VFG2_MSIX_CAP_TABLE_OFFSET(29'H00000000),
    .VFG2_MSIX_CAP_TABLE_SIZE(11'H000),
    .VFG3_MSIX_CAP_PBA_BIR(0),
    .VFG3_MSIX_CAP_PBA_OFFSET(29'H00000000),
    .VFG3_MSIX_CAP_TABLE_BIR(0),
    .VFG3_MSIX_CAP_TABLE_OFFSET(29'H00000000),
    .VFG3_MSIX_CAP_TABLE_SIZE(11'H000),
    .EN_PARITY("FALSE"),
    .INS_LOSS_PROFILE("ADD-IN_CARD"),
    .MSI_X_OPTIONS("None"),
    .COMPLETER_MODEL("FALSE"),
    .DBG_DESCRAMBLE_EN("FALSE"),
    .MSI_INT(32),
    .VU9P_BOARD("FALSE"),
    .PHY_LP_TXPRESET(4),
    .IS_BOARD_PROJECT(0),
    .GT_DRP_CLK_SRC(0),
    .FREE_RUN_FREQ(0),
    .PM_ENABLE_L23_ENTRY("FALSE"),
    .AWS_MODE_VALUE(0),
    .MULT_PF_DES("TRUE"),
    .EXT_SYS_CLK_BUFG("FALSE"),
    .AXISTEN_IF_ENABLE_MSG_ROUTE(18'H20000),
    .AXISTEN_IF_ENABLE_RX_MSG_INTFC("FALSE"),
    .ENABLE_MORE("FALSE"),
    .DISABLE_BRAM_PIPELINE("FALSE"),
    .DISABLE_EQ_SYNCHRONIZER("FALSE"),
    .ENABLE_AUTO_RXEQ("FALSE"),
    .THREE_PORT_SWITCH("FALSE"),
    .ENABLE_MULTIPF_AER("FALSE"),
    .ENABLE_MSIX_32VEC("FALSE"),
    .ENABLE_CLKMUX("FALSE"),
    .RBAR_ENABLE("FALSE"),
    .PF0_RBAR_CAP_BAR0_UPPER(16'H0000),
    .PF0_RBAR_CAP_BAR0_LOWER(32'H0000FFF0),
    .PF0_RBAR_CAP_BAR1_UPPER(16'H0000),
    .PF0_RBAR_CAP_BAR1_LOWER(32'H00000000),
    .PF0_RBAR_CAP_BAR2_UPPER(16'H0000),
    .PF0_RBAR_CAP_BAR2_LOWER(32'H00000000),
    .PF0_RBAR_CAP_BAR3_UPPER(16'H0000),
    .PF0_RBAR_CAP_BAR3_LOWER(32'H00000000),
    .PF0_RBAR_CAP_BAR4_UPPER(16'H0000),
    .PF0_RBAR_CAP_BAR4_LOWER(32'H00000000),
    .PF0_RBAR_CAP_BAR5_UPPER(16'H0000),
    .PF0_RBAR_CAP_BAR5_LOWER(32'H00000000),
    .PF1_RBAR_CAP_BAR0_UPPER(16'H0000),
    .PF1_RBAR_CAP_BAR0_LOWER(32'H0000FFF0),
    .PF1_RBAR_CAP_BAR1_UPPER(16'H0000),
    .PF1_RBAR_CAP_BAR1_LOWER(32'H00000000),
    .PF1_RBAR_CAP_BAR2_UPPER(16'H0000),
    .PF1_RBAR_CAP_BAR2_LOWER(32'H00000000),
    .PF1_RBAR_CAP_BAR3_UPPER(16'H0000),
    .PF1_RBAR_CAP_BAR3_LOWER(32'H00000000),
    .PF1_RBAR_CAP_BAR4_UPPER(16'H0000),
    .PF1_RBAR_CAP_BAR4_LOWER(32'H00000000),
    .PF1_RBAR_CAP_BAR5_UPPER(16'H0000),
    .PF1_RBAR_CAP_BAR5_LOWER(32'H00000000),
    .PF2_RBAR_CAP_BAR0_UPPER(16'H0000),
    .PF2_RBAR_CAP_BAR0_LOWER(32'H0000FFF0),
    .PF2_RBAR_CAP_BAR1_UPPER(16'H0000),
    .PF2_RBAR_CAP_BAR1_LOWER(32'H00000000),
    .PF2_RBAR_CAP_BAR2_UPPER(16'H0000),
    .PF2_RBAR_CAP_BAR2_LOWER(32'H00000000),
    .PF2_RBAR_CAP_BAR3_UPPER(16'H0000),
    .PF2_RBAR_CAP_BAR3_LOWER(32'H00000000),
    .PF2_RBAR_CAP_BAR4_UPPER(16'H0000),
    .PF2_RBAR_CAP_BAR4_LOWER(32'H00000000),
    .PF2_RBAR_CAP_BAR5_UPPER(16'H0000),
    .PF2_RBAR_CAP_BAR5_LOWER(32'H00000000),
    .PF3_RBAR_CAP_BAR0_UPPER(16'H0000),
    .PF3_RBAR_CAP_BAR0_LOWER(32'H0000FFF0),
    .PF3_RBAR_CAP_BAR1_UPPER(16'H0000),
    .PF3_RBAR_CAP_BAR1_LOWER(32'H00000000),
    .PF3_RBAR_CAP_BAR2_UPPER(16'H0000),
    .PF3_RBAR_CAP_BAR2_LOWER(32'H00000000),
    .PF3_RBAR_CAP_BAR3_UPPER(16'H0000),
    .PF3_RBAR_CAP_BAR3_LOWER(32'H00000000),
    .PF3_RBAR_CAP_BAR4_UPPER(16'H0000),
    .PF3_RBAR_CAP_BAR4_LOWER(32'H00000000),
    .PF3_RBAR_CAP_BAR5_UPPER(16'H0000),
    .PF3_RBAR_CAP_BAR5_LOWER(32'H00000000),
    .RBAR_CAP_NEXTPTR(12'H000),
    .PF0_RBAR_NUM_BAR(3'H1),
    .PF1_RBAR_NUM_BAR(3'H1),
    .PF2_RBAR_NUM_BAR(3'H1),
    .PF3_RBAR_NUM_BAR(3'H1),
    .PF0_RBAR_BAR_INDEX_0(3'H0),
    .PF0_RBAR_BAR_INDEX_1(3'H7),
    .PF0_RBAR_BAR_INDEX_2(3'H7),
    .PF0_RBAR_BAR_INDEX_3(3'H7),
    .PF0_RBAR_BAR_INDEX_4(3'H7),
    .PF0_RBAR_BAR_INDEX_5(3'H7),
    .PF1_RBAR_BAR_INDEX_0(3'H0),
    .PF1_RBAR_BAR_INDEX_1(3'H7),
    .PF1_RBAR_BAR_INDEX_2(3'H7),
    .PF1_RBAR_BAR_INDEX_3(3'H7),
    .PF1_RBAR_BAR_INDEX_4(3'H7),
    .PF1_RBAR_BAR_INDEX_5(3'H7),
    .PF2_RBAR_BAR_INDEX_0(3'H0),
    .PF2_RBAR_BAR_INDEX_1(3'H7),
    .PF2_RBAR_BAR_INDEX_2(3'H7),
    .PF2_RBAR_BAR_INDEX_3(3'H7),
    .PF2_RBAR_BAR_INDEX_4(3'H7),
    .PF2_RBAR_BAR_INDEX_5(3'H7),
    .PF3_RBAR_BAR_INDEX_0(3'H0),
    .PF3_RBAR_BAR_INDEX_1(3'H7),
    .PF3_RBAR_BAR_INDEX_2(3'H7),
    .PF3_RBAR_BAR_INDEX_3(3'H7),
    .PF3_RBAR_BAR_INDEX_4(3'H7),
    .PF3_RBAR_BAR_INDEX_5(3'H7),
    .USE_STANDARD_INTERFACES("FALSE"),
    .DMA_2RP("FALSE"),
    .SRIOV_ACTIVE_VFS(252),
    .MASTER_GT_QUAD_INX(3),
    .MASTER_GT_CONTAINER(0),
    .QDMA_TPH_MSIX_BRAMS_DIS("FALSE"),
    .EN_SLOT_CAP_REG("FALSE"),
    .SLOT_CAP_REG(32'H00000040),
    .TANDEM_RFSOC("FALSE")
  ) inst (
    .pci_exp_txn(pci_exp_txn),
    .pci_exp_txp(pci_exp_txp),
    .pci_exp_rxn(pci_exp_rxn),
    .pci_exp_rxp(pci_exp_rxp),
    .user_clk(user_clk),
    .user_reset(user_reset),
    .user_lnk_up(user_lnk_up),
    .gt_drp_clk(),
    .mcap_clk(),
    .core_clk(),
    .s_axis_rq_tdata(s_axis_rq_tdata),
    .s_axis_rq_tkeep(s_axis_rq_tkeep),
    .s_axis_rq_tlast(s_axis_rq_tlast),
    .s_axis_rq_tready(s_axis_rq_tready),
    .s_axis_rq_tuser(s_axis_rq_tuser),
    .s_axis_rq_tvalid(s_axis_rq_tvalid),
    .m_axis_rc_tdata(m_axis_rc_tdata),
    .m_axis_rc_tkeep(m_axis_rc_tkeep),
    .m_axis_rc_tlast(m_axis_rc_tlast),
    .m_axis_rc_tready(m_axis_rc_tready),
    .m_axis_rc_tuser(m_axis_rc_tuser),
    .m_axis_rc_tvalid(m_axis_rc_tvalid),
    .m_axis_cq_tdata(m_axis_cq_tdata),
    .m_axis_cq_tkeep(m_axis_cq_tkeep),
    .m_axis_cq_tlast(m_axis_cq_tlast),
    .m_axis_cq_tready(m_axis_cq_tready),
    .m_axis_cq_tuser(m_axis_cq_tuser),
    .m_axis_cq_tvalid(m_axis_cq_tvalid),
    .s_axis_cc_tdata(s_axis_cc_tdata),
    .s_axis_cc_tkeep(s_axis_cc_tkeep),
    .s_axis_cc_tlast(s_axis_cc_tlast),
    .s_axis_cc_tready(s_axis_cc_tready),
    .s_axis_cc_tuser(s_axis_cc_tuser),
    .s_axis_cc_tvalid(s_axis_cc_tvalid),
    .pcie_rq_seq_num0(pcie_rq_seq_num0),
    .pcie_rq_seq_num_vld0(pcie_rq_seq_num_vld0),
    .pcie_rq_seq_num1(pcie_rq_seq_num1),
    .pcie_rq_seq_num_vld1(pcie_rq_seq_num_vld1),
    .pcie_rq_tag0(pcie_rq_tag0),
    .pcie_rq_tag1(pcie_rq_tag1),
    .pcie_rq_tag_av(pcie_rq_tag_av),
    .pcie_rq_tag_vld0(pcie_rq_tag_vld0),
    .pcie_rq_tag_vld1(pcie_rq_tag_vld1),
    .pcie_tfc_nph_av(pcie_tfc_nph_av),
    .pcie_tfc_npd_av(pcie_tfc_npd_av),
    .pcie_cq_np_req(pcie_cq_np_req),
    .pcie_cq_np_req_count(pcie_cq_np_req_count),
    .cfg_phy_link_down(cfg_phy_link_down),
    .cfg_phy_link_status(cfg_phy_link_status),
    .cfg_negotiated_width(cfg_negotiated_width),
    .cfg_current_speed(cfg_current_speed),
    .cfg_max_payload(cfg_max_payload),
    .cfg_max_read_req(cfg_max_read_req),
    .cfg_function_status(cfg_function_status),
    .cfg_function_power_state(cfg_function_power_state),
    .cfg_vf_status(cfg_vf_status),
    .cfg_vf_power_state(cfg_vf_power_state),
    .cfg_link_power_state(cfg_link_power_state),
    .cfg_mgmt_addr(cfg_mgmt_addr),
    .cfg_mgmt_function_number(cfg_mgmt_function_number),
    .cfg_mgmt_write(cfg_mgmt_write),
    .cfg_mgmt_write_data(cfg_mgmt_write_data),
    .cfg_mgmt_byte_enable(cfg_mgmt_byte_enable),
    .cfg_mgmt_read(cfg_mgmt_read),
    .cfg_mgmt_read_data(cfg_mgmt_read_data),
    .cfg_mgmt_read_write_done(cfg_mgmt_read_write_done),
    .cfg_mgmt_debug_access(cfg_mgmt_debug_access),
    .cfg_err_cor_out(cfg_err_cor_out),
    .cfg_err_nonfatal_out(cfg_err_nonfatal_out),
    .cfg_err_fatal_out(cfg_err_fatal_out),
    .cfg_local_error_valid(cfg_local_error_valid),
    .cfg_local_error_out(cfg_local_error_out),
    .cfg_ltssm_state(cfg_ltssm_state),
    .cfg_rx_pm_state(cfg_rx_pm_state),
    .cfg_tx_pm_state(cfg_tx_pm_state),
    .cfg_rcb_status(cfg_rcb_status),
    .cfg_obff_enable(cfg_obff_enable),
    .cfg_pl_status_change(cfg_pl_status_change),
    .cfg_tph_requester_enable(cfg_tph_requester_enable),
    .cfg_tph_st_mode(cfg_tph_st_mode),
    .cfg_vf_tph_requester_enable(cfg_vf_tph_requester_enable),
    .cfg_vf_tph_st_mode(cfg_vf_tph_st_mode),
    .cfg_msg_received(cfg_msg_received),
    .cfg_msg_received_data(cfg_msg_received_data),
    .cfg_msg_received_type(cfg_msg_received_type),
    .cfg_msg_transmit(cfg_msg_transmit),
    .cfg_msg_transmit_type(cfg_msg_transmit_type),
    .cfg_msg_transmit_data(cfg_msg_transmit_data),
    .cfg_msg_transmit_done(cfg_msg_transmit_done),
    .cfg_fc_ph(cfg_fc_ph),
    .cfg_fc_pd(cfg_fc_pd),
    .cfg_fc_nph(cfg_fc_nph),
    .cfg_fc_npd(cfg_fc_npd),
    .cfg_fc_cplh(cfg_fc_cplh),
    .cfg_fc_cpld(cfg_fc_cpld),
    .cfg_fc_sel(cfg_fc_sel),
    .cfg_dsn(cfg_dsn),
    .cfg_bus_number(cfg_bus_number),
    .cfg_power_state_change_ack(cfg_power_state_change_ack),
    .cfg_power_state_change_interrupt(cfg_power_state_change_interrupt),
    .cfg_err_cor_in(cfg_err_cor_in),
    .cfg_err_uncor_in(cfg_err_uncor_in),
    .cfg_flr_in_process(cfg_flr_in_process),
    .cfg_flr_done(cfg_flr_done),
    .cfg_vf_flr_in_process(cfg_vf_flr_in_process),
    .cfg_vf_flr_func_num(cfg_vf_flr_func_num),
    .cfg_vf_flr_done(cfg_vf_flr_done),
    .cfg_link_training_enable(cfg_link_training_enable),
    .cfg_ext_read_received(),
    .cfg_ext_write_received(),
    .cfg_ext_register_number(),
    .cfg_ext_function_number(),
    .cfg_ext_write_data(),
    .cfg_ext_write_byte_enable(),
    .cfg_ext_read_data(32'B0),
    .cfg_ext_read_data_valid(1'B0),
    .rbar_bar_size(),
    .rbar_function_number(),
    .rbar_write_enable_bar0(),
    .rbar_write_enable_bar1(),
    .rbar_write_enable_bar2(),
    .rbar_write_enable_bar3(),
    .rbar_write_enable_bar4(),
    .rbar_write_enable_bar5(),
    .cfg_interrupt_int(cfg_interrupt_int),
    .cfg_interrupt_pending(cfg_interrupt_pending),
    .cfg_interrupt_sent(cfg_interrupt_sent),
    .cfg_interrupt_msi_enable(cfg_interrupt_msi_enable),
    .cfg_interrupt_msi_mmenable(cfg_interrupt_msi_mmenable),
    .cfg_interrupt_msi_mask_update(cfg_interrupt_msi_mask_update),
    .cfg_interrupt_msi_data(cfg_interrupt_msi_data),
    .cfg_interrupt_msi_select(cfg_interrupt_msi_select),
    .cfg_interrupt_msi_int(cfg_interrupt_msi_int),
    .cfg_interrupt_msi_pending_status(cfg_interrupt_msi_pending_status),
    .cfg_interrupt_msi_pending_status_data_enable(cfg_interrupt_msi_pending_status_data_enable),
    .cfg_interrupt_msi_pending_status_function_num(cfg_interrupt_msi_pending_status_function_num),
    .cfg_interrupt_msi_sent(cfg_interrupt_msi_sent),
    .cfg_interrupt_msi_fail(cfg_interrupt_msi_fail),
    .cfg_interrupt_msi_attr(cfg_interrupt_msi_attr),
    .cfg_interrupt_msi_tph_present(cfg_interrupt_msi_tph_present),
    .cfg_interrupt_msi_tph_type(cfg_interrupt_msi_tph_type),
    .cfg_interrupt_msi_tph_st_tag(cfg_interrupt_msi_tph_st_tag),
    .cfg_interrupt_msi_function_number(cfg_interrupt_msi_function_number),
    .cfg_interrupt_msix_enable(),
    .cfg_interrupt_msix_mask(),
    .cfg_interrupt_msix_vf_enable(),
    .cfg_interrupt_msix_vf_mask(),
    .cfg_pm_aspm_l1_entry_reject(cfg_pm_aspm_l1_entry_reject),
    .cfg_pm_aspm_tx_l0s_entry_disable(cfg_pm_aspm_tx_l0s_entry_disable),
    .cfg_interrupt_msix_data(32'B0),
    .cfg_interrupt_msix_address(64'B0),
    .cfg_interrupt_msix_int(1'B0),
    .cfg_interrupt_msix_vec_pending(2'B0),
    .cfg_interrupt_msix_vec_pending_status(),
    .cfg_hot_reset_out(cfg_hot_reset_out),
    .cfg_config_space_enable(cfg_config_space_enable),
    .cfg_req_pm_transition_l23_ready(cfg_req_pm_transition_l23_ready),
    .cfg_hot_reset_in(cfg_hot_reset_in),
    .cfg_ds_port_number(cfg_ds_port_number),
    .cfg_ds_bus_number(cfg_ds_bus_number),
    .cfg_ds_device_number(cfg_ds_device_number),
    .cfg_ds_function_number(3'B0),
    .cfg_subsys_vend_id(16'H10EE),
    .cfg_dev_id_pf0(16'H9034),
    .cfg_dev_id_pf1(16'H9011),
    .cfg_dev_id_pf2(16'H9434),
    .cfg_dev_id_pf3(16'H9634),
    .cfg_vend_id(16'H10EE),
    .cfg_rev_id_pf0(8'H00),
    .cfg_rev_id_pf1(8'H00),
    .cfg_rev_id_pf2(8'H00),
    .cfg_rev_id_pf3(8'H00),
    .cfg_subsys_id_pf0(16'H0007),
    .cfg_subsys_id_pf1(16'H0007),
    .cfg_subsys_id_pf2(16'H0007),
    .cfg_subsys_id_pf3(16'H0007),
    .sys_clk(sys_clk),
    .sys_clk_ce_out(),
    .sys_clk_gt(sys_clk_gt),
    .sys_reset(sys_reset),
    .conf_req_type(2'B0),
    .conf_req_reg_num(4'B0),
    .conf_req_data(32'B0),
    .conf_req_valid(1'B0),
    .conf_req_ready(),
    .conf_resp_rdata(),
    .conf_resp_valid(),
    .pl_gen2_upstream_prefer_deemph(1'B0),
    .pl_eq_in_progress(),
    .pl_redo_eq(1'B0),
    .pl_redo_eq_speed(1'B0),
    .pl_eq_mismatch(),
    .pl_redo_eq_pending(),
    .pl_eq_phase(),
    .ext_qpllxrefclk(),
    .ext_qpllxrcalenb(),
    .ext_qpllxrate(),
    .ext_qpll0pd(),
    .ext_qpll0reset(),
    .ext_qpll0lock_out(1'B0),
    .ext_qpll0outclk_out(1'B0),
    .ext_qpll0outrefclk_out(1'B0),
    .int_qpll0lock_out(),
    .int_qpll0outrefclk_out(),
    .int_qpll0outclk_out(),
    .ext_qpll1pd(),
    .ext_qpll1reset(),
    .ext_qpll1lock_out(1'B0),
    .ext_qpll1outclk_out(1'B0),
    .ext_qpll1outrefclk_out(1'B0),
    .int_qpll1lock_out(),
    .int_qpll1outrefclk_out(),
    .int_qpll1outclk_out(),
    .common_commands_in(26'B0),
    .pipe_rx_0_sigs(84'B0),
    .pipe_rx_1_sigs(84'B0),
    .pipe_rx_2_sigs(84'B0),
    .pipe_rx_3_sigs(84'B0),
    .pipe_rx_4_sigs(84'B0),
    .pipe_rx_5_sigs(84'B0),
    .pipe_rx_6_sigs(84'B0),
    .pipe_rx_7_sigs(84'B0),
    .pipe_rx_8_sigs(84'B0),
    .pipe_rx_9_sigs(84'B0),
    .pipe_rx_10_sigs(84'B0),
    .pipe_rx_11_sigs(84'B0),
    .pipe_rx_12_sigs(84'B0),
    .pipe_rx_13_sigs(84'B0),
    .pipe_rx_14_sigs(84'B0),
    .pipe_rx_15_sigs(84'B0),
    .common_commands_out(),
    .pipe_tx_0_sigs(),
    .pipe_tx_1_sigs(),
    .pipe_tx_2_sigs(),
    .pipe_tx_3_sigs(),
    .pipe_tx_4_sigs(),
    .pipe_tx_5_sigs(),
    .pipe_tx_6_sigs(),
    .pipe_tx_7_sigs(),
    .pipe_tx_8_sigs(),
    .pipe_tx_9_sigs(),
    .pipe_tx_10_sigs(),
    .pipe_tx_11_sigs(),
    .pipe_tx_12_sigs(),
    .pipe_tx_13_sigs(),
    .pipe_tx_14_sigs(),
    .pipe_tx_15_sigs(),
    .gt_pcieuserratedone(4'B0),
    .gt_loopback(12'B0),
    .gt_txprbsforceerr(4'B0),
    .gt_txinhibit(4'B0),
    .gt_txprbssel(16'B0),
    .gt_rxprbssel(16'B0),
    .gt_rxprbscntreset(4'B0),
    .gt_txelecidle(),
    .gt_txresetdone(),
    .gt_rxresetdone(),
    .gt_rxpmaresetdone(),
    .gt_txphaligndone(),
    .gt_txphinitdone(),
    .gt_txdlysresetdone(),
    .gt_rxphaligndone(),
    .gt_rxdlysresetdone(),
    .gt_rxsyncdone(),
    .gt_eyescandataerror(),
    .gt_rxprbserr(),
    .gt_dmonfiforeset(4'B0),
    .gt_dmonitorclk(4'B0),
    .gt_dmonitorout(),
    .gt_rxcommadet(),
    .gt_phystatus(),
    .gt_rxvalid(),
    .gt_rxcdrlock(),
    .gt_pcierateidle(),
    .gt_pcieuserratestart(),
    .gt_gtpowergood(),
    .gt_cplllock(),
    .gt_rxoutclk(),
    .gt_rxrecclkout(),
    .gt_qpll1lock(),
    .gt_qpll0lock(),
    .gt_rxstatus(),
    .gt_rxbufstatus(),
    .gt_bufgtdiv(),
    .phy_txeq_ctrl(),
    .phy_txeq_preset(),
    .phy_rst_fsm(),
    .phy_txeq_fsm(),
    .phy_rxeq_fsm(),
    .phy_rst_idle(),
    .phy_rrst_n(),
    .phy_prst_n(),
    .ext_ch_gt_drpclk(),
    .gt_gen34_eios_det(),
    .gt_txoutclk(),
    .gt_txoutclkfabric(),
    .gt_rxoutclkfabric(),
    .gt_txoutclkpcs(),
    .gt_rxoutclkpcs(),
    .gt_txpmareset(4'B0),
    .gt_rxpmareset(4'B0),
    .gt_txpcsreset(4'B0),
    .gt_rxpcsreset(4'B0),
    .gt_rxbufreset(4'B0),
    .gt_rxcdrreset(4'B0),
    .gt_rxdfelpmreset(4'B0),
    .gt_txprogdivresetdone(),
    .gt_txpmaresetdone(),
    .gt_txsyncdone(),
    .gt_rxprbslocked(),
    .ext_ch_gt_drpaddr(40'B0),
    .ext_ch_gt_drpen(4'B0),
    .ext_ch_gt_drpdi(64'B0),
    .ext_ch_gt_drpwe(4'B0),
    .ext_ch_gt_drpdo(),
    .ext_ch_gt_drprdy(),
    .drp_rdy(),
    .drp_do(),
    .drp_clk(1'B1),
    .drp_en(1'B0),
    .drp_we(1'B0),
    .drp_addr(10'B0),
    .drp_di(16'B0),
    .gtrefclk01_in(),
    .gtrefclk00_in(),
    .pcierateqpll0_in(),
    .pcierateqpll1_in(),
    .qpll0pd_in(),
    .qpll0reset_in(),
    .qpll1pd_in(),
    .qpll1reset_in(),
    .rcalenb_in(),
    .qpll0lock_out(1'B0),
    .qpll0outclk_out(1'B0),
    .qpll0outrefclk_out(1'B0),
    .qpll1lock_out(1'B0),
    .qpll1outclk_out(1'B0),
    .qpll1outrefclk_out(1'B0),
    .qpll0freqlock_in(),
    .qpll1freqlock_in(),
    .pcierateqpllpd_out(8'B0),
    .pcierateqpllreset_out(8'B0),
    .gtwiz_reset_rx_done_in(),
    .gtwiz_reset_tx_done_in(),
    .gtwiz_userclk_rx_active_in(),
    .gtwiz_userclk_tx_active_in(),
    .loopback_in(),
    .rxpd_in(),
    .rxprbssel_in(),
    .rxrate_in(),
    .txctrl0_in(),
    .txctrl1_in(),
    .txctrl2_in(),
    .txdata_in(),
    .txdeemph_in(),
    .txdiffctrl_in(),
    .txprbssel_in(),
    .txprecursor_in(),
    .txrate_in(),
    .txmaincursor_in(),
    .txmargin_in(),
    .txoutclksel_in(),
    .txpd_in(),
    .txpostcursor_in(),
    .cpllfreqlock_in(),
    .cpllpd_in(),
    .cpllreset_in(),
    .dmonfiforeset_in(),
    .dmonitorclk_in(),
    .eyescanreset_in(),
    .gtrefclk0_in(),
    .gtrxreset_in(),
    .txpisopd_in(),
    .gttxreset_in(),
    .pcieeqrxeqadaptdone_in(),
    .pcierstidle_in(),
    .pciersttxsyncstart_in(),
    .pcieuserratedone_in(),
    .resetovrd_in(),
    .rx8b10ben_in(),
    .rxbufreset_in(),
    .rxcdrfreqreset_in(),
    .rxcdrhold_in(),
    .rxcdrreset_in(),
    .rxcommadeten_in(),
    .rxdfeagchold_in(),
    .rxdfecfokhold_in(),
    .rxdfekhhold_in(),
    .rxdfelfhold_in(),
    .rxdfelpmreset_in(),
    .rxdfetap10hold_in(),
    .rxdfetap11hold_in(),
    .rxdfetap12hold_in(),
    .rxdfetap13hold_in(),
    .rxdfetap14hold_in(),
    .rxdfetap15hold_in(),
    .rxdfetap2hold_in(),
    .rxdfetap3hold_in(),
    .rxdfetap4hold_in(),
    .rxdfetap5hold_in(),
    .rxdfetap6hold_in(),
    .rxdfetap7hold_in(),
    .rxdfetap8hold_in(),
    .rxdfetap9hold_in(),
    .rxdfeuthold_in(),
    .rxdfevphold_in(),
    .rxlpmen_in(),
    .rxlpmgchold_in(),
    .rxlpmhfhold_in(),
    .rxlpmlfhold_in(),
    .rxlpmoshold_in(),
    .rxmcommaalignen_in(),
    .rxoshold_in(),
    .rxpcommaalignen_in(),
    .rxpcsreset_in(),
    .rxpmareset_in(),
    .rxpolarity_in(),
    .rxprbscntreset_in(),
    .rxprogdivreset_in(),
    .rxslide_in(),
    .rxtermination_in(),
    .rxuserrdy_in(),
    .rxusrclk2_in(),
    .rxusrclk_in(),
    .tx8b10ben_in(),
    .txdetectrx_in(),
    .txdlybypass_in(),
    .txdlyen_in(),
    .txdlyhold_in(),
    .txdlyovrden_in(),
    .txdlysreset_in(),
    .txdlyupdown_in(),
    .txelecidle_in(),
    .txpcsreset_in(),
    .txphalign_in(),
    .txphalignen_in(),
    .txphdlypd_in(),
    .txphdlyreset_in(),
    .txphdlytstclk_in(),
    .txphinit_in(),
    .txphovrden_in(),
    .rxratemode_in(),
    .txpmareset_in(),
    .txprbsforceerr_in(),
    .txprogdivreset_in(),
    .txpdelecidlemode_in(),
    .txswing_in(),
    .txsyncallin_in(),
    .txsyncin_in(),
    .txsyncmode_in(),
    .txuserrdy_in(),
    .txusrclk2_in(),
    .txusrclk_in(),
    .rxclkcorcnt_out(8'B0),
    .bufgtcemask_out(12'B0),
    .bufgtrstmask_out(12'B0),
    .rxbufstatus_out(12'B0),
    .rxstatus_out(12'B0),
    .rxctrl2_out(32'B0),
    .rxctrl3_out(32'B0),
    .bufgtdiv_out(36'B0),
    .dmonitorout_out(64'B0),
    .rxctrl0_out(64'B0),
    .rxctrl1_out(64'B0),
    .rxdata_out(512'B0),
    .bufgtreset_out(4'B0),
    .bufgtce_out(4'B0),
    .cplllock_out(4'B0),
    .gtpowergood_out(4'B0),
    .pcierategen3_out(4'B0),
    .pcierateidle_out(4'B0),
    .pciesynctxsyncdone_out(4'B0),
    .pcieusergen3rdy_out(4'B0),
    .pcieuserphystatusrst_out(4'B0),
    .pcieuserratestart_out(4'B0),
    .phystatus_out(4'B0),
    .rxbyteisaligned_out(4'B0),
    .rxbyterealign_out(4'B0),
    .rxcdrlock_out(4'B0),
    .rxcommadet_out(4'B0),
    .rxphaligndone_out(4'B0),
    .rxpmaresetdone_out(4'B0),
    .rxdlysresetdone_out(4'B0),
    .rxelecidle_out(4'B0),
    .rxoutclk_out(4'B0),
    .rxoutclkfabric_out(4'B0),
    .rxoutclkpcs_out(4'B0),
    .rxprbserr_out(4'B0),
    .rxprbslocked_out(4'B0),
    .rxratedone_out(4'B0),
    .rxrecclkout_out(4'B0),
    .rxresetdone_out(4'B0),
    .rxsyncdone_out(4'B0),
    .txdlysresetdone_out(4'B0),
    .rxvalid_out(4'B0),
    .txoutclk_out(4'B0),
    .txoutclkfabric_out(4'B0),
    .txoutclkpcs_out(4'B0),
    .txphaligndone_out(4'B0),
    .txphinitdone_out(4'B0),
    .txpmaresetdone_out(4'B0),
    .txprgdivresetdone_out(4'B0),
    .txresetdone_out(4'B0),
    .txsyncdone_out(4'B0),
    .txsyncout_out(4'B0),
    .drpaddr_in(),
    .drpen_in(),
    .drpdi_in(),
    .drpwe_in(),
    .drprst_in(),
    .drpdo_out(64'B0),
    .drprdy_out(4'B0),
    .drpclk_in(),
    .ext_phy_clk_bufg_gt_ce(),
    .ext_phy_clk_bufg_gt_reset(),
    .ext_phy_clk_rst_idle(),
    .ext_phy_clk_txoutclk(),
    .ext_phy_clk_bufgtcemask(),
    .ext_phy_clk_gt_bufgtrstmask(),
    .ext_phy_clk_bufgtdiv(),
    .ext_phy_clk_pclk2_gt(1'B0),
    .ext_phy_clk_int_clock(1'B0),
    .ext_phy_clk_pclk(1'B0),
    .ext_phy_clk_phy_pclk2(1'B0),
    .ext_phy_clk_phy_coreclk(1'B0),
    .ext_phy_clk_phy_userclk(1'B0),
    .ext_phy_clk_phy_mcapclk(1'B0),
    .cap_req(),
    .cap_gnt(1'B1),
    .cap_rel(1'B0),
    .mcap_design_switch(),
    .startup_cfgclk(),
    .startup_cfgmclk(),
    .startup_di(),
    .startup_eos(),
    .startup_preq(),
    .startup_do(4'B0),
    .startup_dts(4'B0),
    .startup_fcsbo(1'B0),
    .startup_fcsbts(1'B0),
    .startup_gsr(1'B0),
    .startup_gts(1'B0),
    .startup_keyclearb(1'B1),
    .startup_pack(1'B0),
    .startup_usrcclko(1'B0),
    .startup_usrcclkts(1'B1),
    .startup_usrdoneo(1'B0),
    .startup_usrdonets(1'B1),
    .free_run_clock(1'B0),
    .phy_rdy_out(phy_rdy_out),
    .prst_clk(1'B0)
  );
endmodule
