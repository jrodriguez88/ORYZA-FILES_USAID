**********************************************************************
* Template soil data file for PADDY soil water balance model.        *
* File name   : PADDYIN.DAT                                          *
* Soil        : Franco_Arcilloso                                     *
* Experiment  : Aclimate.org                                         *
*                    Convenios Colombia:                             *
*                    MADR-COLCIENCIAS-CIAT-FEDEARROZ 2012-2015
**********************************************************************

* Give code name of soil data file to match the water balance PADDY:
SCODE = 'PADDY'

*---------------------------------------------------------------*
* 1. Various soil and management parameters
*---------------------------------------------------------------*
WL0MX = 100.  ! Bund height (mm)
NL    = 3     ! Number of soil layers (maximum is 10) (-)
TKL   = 0.20, 0.20, 0.20! Thickness of each soil layer (m)
ZRTMS = 0.50   ! Maximum rooting depth in the soil (m)

*---------------------------------------------------------------*
* 2. Puddling switch: 1=PUDDLED or 0=NON PUDDLED
*---------------------------------------------------------------*
SWITPD = 0 ! Non puddled
*SWITPD = 1  ! Puddled

* If PUDDLED, supply parameters for puddled soil
NLPUD = 1 ! Number of puddled soil layers, including the plow sole (-)
          ! (NLPUD cannot exceed the total number of soil layers NL)
* Saturated volumetric water content of ripened (previously puddled) 
* soil (m3 m-3), for each soil layer:
WCSTRP = 0.46, 0.41, 0.43

* Soil water tension of puddled soil layer at which cracks reach 
* break through the plow sole (pF):
PFCR = 5.0 

*---------------------------------------------------------------*
* 3. Groundwater switch: 0=DEEP (i.e., not in profile), 1=DATA 
* (supplied), 2=CALCULATE
*---------------------------------------------------------------*
SWITGW = 0 ! Deep groundwater
*SWITGW = 2 ! Calculate groundwater
*SWITGW = 1 ! Groundwater data

* If DATA, supply table of groundwater table depth (cm; Y-value) 
* as function of calendar day (d; X value):
ZWTB =   1.,500.,
       366.,500.

* If CALCULATE, supply the following parameters:
ZWTBI = 500. ! Initial groundwater table depth (cm)
MINGW = 500. ! Minimum groundwater table depth (cm)
MAXGW = 500. ! Maximum groundwater table depth (cm)
ZWA   = 1.0  ! Receding rate of groundwater with no recharge (cm d-1)
ZWB   = 0.5  ! Sensitivity factor of groundwater recharge (-)

*---------------------------------------------------------------*
* 4. Percolation switch
* Value for SWITVP can not be 1 (CALCULATE) for nonpuddled soil
*---------------------------------------------------------------*
SWITVP = -1 ! Fixed percolation rate
*SWITVP = 0 ! Percolation as function of the groundwater depth
*SWITVP = 1 ! Calculate percolation

* If SWITVP = -1, supply fixed percolation rate (mm d-1):
FIXPERC = 8.0  !   3.0

* If SWITVP = 0, supply table of percolation rate (mm d-1; Y-value) 
* as function of water table depth (cm; X value):
*PERTB =   0., 3., 
*         200., 3. 

*---------------------------------------------------------------*
* 5. Conductivity switch: 0=NO DATA, 1=VAN GENUCHTEN or 2=POWER
*    function used
*---------------------------------------------------------------*
SWITKH = 0 ! No data
*SWITKH = 2 ! Power
*SWITKH  = 1 ! van Genuchten

*---------------------------------------------------------------*
* 6. Water retention switch: 0=DATA; 1=VAN GENUCHTEN. When DATA, data
* have to be supplied for saturation, field capacity,
* wilting point and at air dryness
*---------------------------------------------------------------*
SWITPF = 0 ! Data
*SWITPF  = 1 ! van Genuchten

*---------------------------------------------------------------*
*7.Soil physical properties, these parameters will be used when model
*runs under actual water or nitrogen condition, or even both. Otherwise
*these parameter will not be used.
CLAYX = 0.35,0.38, 0.38      !soil clay contents, fraction
SANDX = 0.30,0.28, 0.33       !soil sand contents, fraction
BD = 1.29,1.40,1.38      !Bulk Density
*Soil organic carbon and nitrogen content in kg C or N/ha
SOC = 58390.,14563.,9851.    !9222.,23298.,3524.,2162.,1261.,1510.
SON = 6645.,33022.,2219.       !461.,1164.,176.,108.,63.,75.
SNH4X = 5.3,3.8,4.6        !4.6,11.6,1.8,1.1,0.6,0.8
SNO3X = 10.8,1.9,2.2      !1.4,3.5,0.5,0.3,0.2,0.2
*Fresh organic carbon and nitrogen input at soil layers
*FORGANC =200.0,150.0,100.0,50.0,5*0.0           !Fresh organic residue carbon input from previous crop at kg C/ha
*FORGANN =4.0,3.0,2.0,1.0,5*0.0                  !Fresh organic residue nitrogen input from previous crop at kg N/ha
*If the carbonhydrate and cellulous fractions are available in soil residue carbon input
* otherwise, the default values will be used
*FCarbonh =
*FCellulo =
*RCarbonh =
*RCellulo =

*---------------------------------------------------------------*
* 7. Soil hydrological properties. Required type of data input
* according to setting of conductivity and water retention switch
*---------------------------------------------------------------*
* Saturated hydraulic conductivity, for each soil layer 
* (cm d-1) (always required!):
KST = 15., 5.5, 4.8

* Saturated volumetric water content, for each soil layer  
* (m3 m-3)(always required!):
WCST = 0.46,0.41, 0.43

* Van Genuchten parameters, for each soil layer
* (needed if SWITKH = 1 and/or SWITPF = 1):
*VGA = 3*0.127, 3*0.047, 2*0.078, 0.032 ! a parameter (cm-1)
*VGL = 3*-6.2, 3*-0.6, 2*-4.9, -11.1    ! l parameter (-)
*VGN = 3*1.119, 3*1.095, 2*1.076, 1.073 ! n parameter (-)
*VGR = 9*0.01                           ! residual water content (-)

* Power function parameters, for each soil layer (-)
* (needed if SWITKH = 2):
*PN = 3*-2.5, 3*-2.5, 2*-2.5, -2.5

* Volumetric water content at field capacity, for each soil layer 
* (m3 m-3)(needed if SWITPF = 0):
WCFC = 0.38,0.36,0.36

* Volumetric water content at wilting point, for each soil layer 
* (m3 m-3) (needed if SWITPF = 0):
WCWP = 0.27,0.26, 0.27

* Volumetric water content at air dryness, for each soil layer
* (m3 m-3) (needed if SWITPF = 0):

WCAD = 3*0.1 
*---------------------------------------------------------------*
* 8. Initialization conditions, and re-initialization
*---------------------------------------------------------------*
WL0I = 50.   ! Initial ponded water depth at start of simulation (mm)

* Initial volumetric water content at the start of simulation,
* for each soil layer (m3 m-3):
WCLI = 0.38,0.36,0.36

* Initial ponded water depth and water contents may be reset:
* Ponded water depth: at minimum of WL0I and WL0MX
* Water contents in all soil layers: at saturation value
* For direct-seeded rice, this happens at sowing, for transplanted
* rice, this happens at transplanting 
* Re-initialize switch RI  is YES or NO
*RIWCLI = 'NO'
RIWCLI = 'YES'

*---------------------------------------------------------------*
* 9. Initialization of soil thermal conditions
*---------------------------------------------------------------*
SATAV = 25.0       !Soil annual avaerage temperature of the first layers
SOILT = 25.0, 24.0, 23.0   !Initial soil temperature in each layer
*                  !Have to provide above either one and two of abov paremeter, otherwise,
*                  !model start the calculation of soil temperature at 0 degree

*---------------------------------------------------------------*
* 10. Observations/measurements
*    Switches to force observed water content in water balance
*---------------------------------------------------------------*

* WCL1_OBS, WCL2_OBS,...WCL10_OBS: Observed soil water contents 
* in layer 1, 2, ..., 10. Format: year, day number, water content
* Not obligatory to give data

* Table for interpolation of water content between soil layers for
* those layers for which no observations were made: first number is
* the soil layer for which interpolation needs to be done, the second
* is the number of the underlying soil layer, the third is the number 
* of the overlying soil layer. No interpolation is performed when all 
* three numbers are the same: 
WCLINT  = 1, 1, 1,
2, 2, 2,
3, 3, 3