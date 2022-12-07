//------------ Get files information ----------------

//Get image name and id
title = getTitle();
original_image_ID = getImageID();

//Remove extension
dotIndex = indexOf(title, ".");
title_without_extension = substring(title, 0, dotIndex);

//Get file directory
path = getDirectory("image");

//Create a new folder
folder = path + File.separator + title_without_extension + "_crop"
File.makeDirectory(folder);

//Doesn't open images
setBatchMode(true);

//------------ Crop realization ----------------
						
//Analyze particles
//!\\ Adapt the size
run("Analyze Particles...", "size=30.00-150.00 show=Outlines display exclude clear add stack");
selectImage(title);
roiManager("Show None");

//Create loop to obtain cells position
coord=roiManager("count");
for (i=0; i<coord;i++){
	selectImage(original_image_ID); 
    roiManager("Select", i);
    getSelectionCoordinates(x, y);

    //Duplicate the image
    run("Duplicate...", "title");
    
    
    //Crop image
    run("Crop"); 
    
    //Copy selection in a new black image (100x100 pixels)
    run("Copy");
  	newImage("Untitled", "8-bit black", 100, 100, 1);
  	makeRectangle(0,0,100,100);
  	run("Paste");
    title2 = getTitle();
    
//------------ Save images ----------------
  
    //Save name of the crop
    title_to_save = title_without_extension + "_" +  i + "_" + x[0] + "_" + y[0] + ".png";
    
    //Save images in a folder in the same directory as the video
    selectWindow(title2);
    saveAs("PNG", folder + File.separator + title_to_save);
}
