// =======================================================================================
// Project     : NetFPGA DE4
// 
// Description : PCIe Interface APIs
//
// Revision Control Information
//
// Author      : RCG
// Revision    : 
// Date        : 
// ======================================================================================


#include <time.h>
#include "stdio.h"
#include "wdc_defs.h"
#include "wdc_lib.h"
#include <stdlib.h>
#include <time.h>
#include "utils.h"
#include "status_strings.h"
#include "samples/shared/diag_lib.h"
#include "samples/shared/wdc_diag_lib.h"
#include "samples/shared/pci_regs.h"
#include "pcie_sw_lib.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define NUMBER_OF_DESCRPT 2

unsigned int OnRCSlaveRead(WDC_DEVICE_HANDLE hDev, int bar, unsigned int addr)
{
	unsigned int u32Data=0;
	WDC_ReadAddr32(hDev, bar, addr, &u32Data);
	return u32Data;
}

void OnRCSlaveWrite(WDC_DEVICE_HANDLE hDev, int bar, unsigned int addr, unsigned int u32Data)
{
   WDC_WriteAddr32(hDev,bar,addr,u32Data);
}


 