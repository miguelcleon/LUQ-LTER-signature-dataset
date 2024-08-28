source('./LUQ20StreamChem.R')
QPChem <- dt8
QSChem <- dt9

unique(QPChem$Sample_ID)


summary(QPChem)
QPChem$Na <- as.numeric(QPChem$Na)

names(QPChem)
# if PotassiumCode is BDL then K is NA
QPChem$K <- as.numeric(QPChem$K)
QPChem$K[QPChem$PotassiumCode == "BDL"] <- NA
# if MagnesiumCode is BDL then Mg is NA
QPChem$Mg <- as.numeric(QPChem$Mg)
QPChem$Mg[QPChem$MagnesiumCode == "BDL"] <- NA
# if CalciumCode is BDL then Ca is NA
QPChem$Ca <- as.numeric(QPChem$Ca)
QPChem$Ca[QPChem$CalciumCode == "BDL"] <- NA
# if NH4Code is BDL then NH4N is NA
QPChem$NH4.hyphen.N <- as.numeric(QPChem$NH4.hyphen.N)
QPChem$NH4.hyphen.N[QPChem$NH4Code == "BDL"] <- NA
# if PO4Code is BDL then PO4P is NA
QPChem$PO4.hyphen.P <- as.numeric(QPChem$PO4.hyphen.P)
QPChem$PO4.hyphen.P[QPChem$PO4Code == "BDL"] <- NA
# if DOCCode is BDL then DOC is NA
QPChem$DOC <- as.numeric(QPChem$DOC)
QPChem$DOC[QPChem$DOCCode == "BDL"] <- NA
# if DICCode is BDL then DIC is NA
QPChem$DIC <- as.numeric(QPChem$DIC)
QPChem$DIC[QPChem$DICCode == "BDL"] <- NA
# if TDNCode is BDL then TDN is NA
QPChem$TDN <- as.numeric(QPChem$TDN)
QPChem$TDN[QPChem$TDNCode == "BDL"] <- NA
# if SiO2Code is BDL then SiO2 is NA
QPChem$SiO2 <- as.numeric(QPChem$SiO2)
QPChem$SiO2[QPChem$SiO2Code == "BDL"] <- NA
# if DONCode is BDL then DON is NA
QPChem$DON <- as.numeric(QPChem$DON)
# QPChem$DON[QPChem$DONCode == "BDL"] <- NA
# if SO4Code is BDL then SO4 is NA
QPChem$SO4.hyphen.S  <- as.numeric(QPChem$SO4.hyphen.S )
QPChem$SO4.hyphen.S[QPChem$SulfateCode == "BDL"] <- NA

QPChemv2 <- QPChem %>%
  select(Sample_Date, Gage_Ht, Temp, Cond, Cl,pH, K, Na, Mg, Ca, NO3.hyphen.N,
         "NH4.hyphen.N", "PO4.hyphen.P", SO4.hyphen.S, SiO2,
  DOC, DIC, TDN, TDP, DIC, DON, TSS) %>%
  rename(Date=Sample_Date,
            Gage_Ht_QP=Gage_Ht,
                  Temp_QP=Temp,
         Cond_QP=Cond,
         pH_QP=pH,
         Cl_QP=Cl,
         Na_QP=Na,
         K_QP=K,
         Mg_QP=Mg,
         Ca_QP=Ca,
         NO3N_QP=NO3.hyphen.N,
  NH4N_QP=NH4.hyphen.N,
         PO4P_QP=PO4.hyphen.P,
    SO4_QP=SO4.hyphen.S,
         SiO2_QP=SiO2,
  DOC_QP=DOC,
         DIC_QP=DIC,
         TDN_QP=TDN,
    TDP_QP=TDP,
    DIC_QP=DIC,
    DON_QP=DON,
    TSS_QP=TSS)

QSChem$K <- as.numeric(QSChem$K)
QSChem$K[QSChem$PotassiumCode == "BDL"] <- NA
# if MagnesiumCode is BDL then Mg is NA
QSChem$Mg <- as.numeric(QSChem$Mg)
QSChem$Mg[QSChem$MagnesiumCode == "BDL"] <- NA
# if CalciumCode is BDL then Ca is NA
QSChem$Ca <- as.numeric(QSChem$Ca)
QSChem$Ca[QSChem$CalciumCode == "BDL"] <- NA
# if NH4Code is BDL then NH4N is NA
QSChem$NH4.hyphen.N <- as.numeric(QSChem$NH4.hyphen.N)
QSChem$NH4.hyphen.N[QSChem$NH4Code == "BDL"] <- NA
# if PO4Code is BDL then PO4P is NA
QSChem$PO4.hyphen.P <- as.numeric(QSChem$PO4.hyphen.P)
QSChem$PO4.hyphen.P[QSChem$PO4Code == "BDL"] <- NA
# if DOCCode is BDL then DOC is NA
QSChem$DOC <- as.numeric(QSChem$DOC)
QSChem$DOC[QSChem$DOCCode == "BDL"] <- NA
# if DICCode is BDL then DIC is NA
QSChem$DIC <- as.numeric(QSChem$DIC)
QSChem$DIC[QSChem$DICCode == "BDL"] <- NA
# if TDNCode is BDL then TDN is NA
QSChem$TDN <- as.numeric(QSChem$TDN)
QSChem$TDN[QSChem$TDNCode == "BDL"] <- NA
# if SiO2Code is BDL then SiO2 is NA
QSChem$SiO2 <- as.numeric(QSChem$SiO2)
QSChem$SiO2[QSChem$SiO2Code == "BDL"] <- NA
QSChem$SO4.hyphen.S  <- as.numeric(QSChem$SO4.hyphen.S )
QSChem$SO4.hyphen.S[QSChem$SulfateCode == "BDL"] <- NA


QSChemv2 <- QSChem %>%
  select(Sample_Date, Temp, Gage_Ht, Cond, Cl,pH, K, Na, Mg, Ca, NO3.hyphen.N,
         "NH4.hyphen.N", "PO4.hyphen.P", SO4.hyphen.S, SiO2,
  DOC, DIC, TDN, TDP, DIC, DON, TSS) %>%
  rename(Date=Sample_Date,
         Gage_Ht_QS=Gage_Ht,
         Temp_QS=Temp,
         Cond_QS=Cond,
         pH_QS=pH,
         Cl_QS=Cl,
         Na_QS=Na,
         K_QS=K,
         Mg_QS=Mg,
         Ca_QS=Ca,
         NO3N_QS=NO3.hyphen.N,
  NH4N_QS=NH4.hyphen.N,
         PO4P_QS=PO4.hyphen.P,
    SO4_QS=SO4.hyphen.S,
         SiO2_QS=SiO2,
  DOC_QS=DOC,
         DIC_QS=DIC,
         TDN_QS=TDN,
    TDP_QS=TDP,
    DIC_QS=DIC,
    DON_QS=DON,
    TSS_QS=TSS)