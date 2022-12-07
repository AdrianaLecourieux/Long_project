//This macro perfoms stack pre-processing
//Input : original stack
//Output : preprocessed stack

//------------ Get files information ----------------

//Get image name and id
title = getTitle();

//Get file directory
path = getDirectory("image");

//Doesn't open images
setBatchMode(true);

//------------ Film pre-processing ----------------

//Select channel 2
run("Duplicate...", "duplicate channels=2");

//Smooth the film
run("Smooth", "stack");

//Perform Z projection on 3 layouts
run("Z Project...", "stop=3 projection=[Max Intensity] all");

//Make binary
run("Make Binary", "method=Default background=Default calculate");

//Remove small particles
run("Erode", "stack");
run("Dilate", "stack");

//Remove the 30 first images
run("Duplicate...", "duplicate range=30-130");

//Get the new film ID
new_film_ID = getImageID();
selectImage(new_film_ID);

//Save stack
saveAs("tif", path + title + "_preprocessed");