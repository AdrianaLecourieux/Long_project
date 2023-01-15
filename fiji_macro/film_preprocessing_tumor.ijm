//This macro perfoms stack pre-processing
//Input : original stack
//Output : preprocessed stack

//------------ Get files information ----------------

//Get image name and id
title = getTitle();

//Remove extension
dotIndex = indexOf(title, ".");
title_without_extension = substring(title, 0, dotIndex);

//Get file directory
path = getDirectory("image");

//Doesn't open images
setBatchMode(true);

//------------ Film pre-processing ----------------

// Set threshold
setThreshold(2104, 65535, "raw");

//Smooth the film
run("Smooth", "stack");

//Make binary
run("Make Binary", "method=MaxEntropy background=Dark calculate");

//Remove small particles
run("Erode", "stack");
run("Dilate", "stack");

//Remove the 30 first images
run("Duplicate...", "duplicate range=30-130");

//Get the new film ID
new_film_ID = getImageID();
selectImage(new_film_ID);

//Save stack
saveAs("tif", path + title_without_extension + "_preprocessed");