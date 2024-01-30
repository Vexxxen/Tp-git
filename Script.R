library(openxlsx)

# Définir les colonnes à traiter
columns_to_process <- c("Price", "Guest Satisfaction", "Person Capacity", "City Center (km)",
                        "Cleanliness Rating", "Metro Distance (km)", "Attraction Index",
                        "Normalised Attraction Index", "Restraunt Index", "Normalised Restraunt Index")

# Supprimer ce qui vient après le point (.)
for (col in columns_to_process) {
  airbnb_europe[[col]] <- sub("\\..*", "", airbnb_europe[[col]])
}

# convrtir les colonnes 
airbnb_europe[, columns_to_process] <- lapply(airbnb_europe[, columns_to_process], as.numeric)



# Enregistrer le fichier sous format Excel dans mon pc
write.xlsx(airbnb_europe, file = "modified_airbnb_europe.xlsx", rowNames = FALSE)
