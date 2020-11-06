!************************************************************************************************************************
! Module containing common data for all methods and databases
!************************************************************************************************************************
MODULE commonData

IMPLICIT NONE

SAVE

TYPE GasMixInfo
  REAL(8)  :: P,T  ! Gas properties
  REAL(8)  :: xCO2,xH2O,xCO,xCH4,xC2H4  ! species mole fraction (more can be added)
  REAL(8)  :: fv  ! soot volume fraction
END TYPE GasMixInfo
END MODULE commonData

