//This macro realised Z projection on preprocessed stack (3 slices by 3 slices) 
//Input : Preprocessed film
//Output : stack of slices with Z projection 

//------------ Get files information ----------------

//Get image name
title = getTitle();

//Remove extension
dotIndex = indexOf(title, ".");
title_without_extension = substring(title, 0, dotIndex);

//Get file directory
path = getDirectory("image");
    
//Create a new folder
folder = path + File.separator + title_without_extension + "_Z_projection";
File.makeDirectory(folder);

//------------ Z projection ---------------- 

//Get image ID
main_image = getImageID();

//loop through the slices
for (start_slice=1; start_slice<nSlices+1; start_slice++) {	
	end_slice = start_slice+ 2;
	
	//Doesn't open images
	setBatchMode(true);
	
	//Z projection
	run("Z Project...", "start=start_slice stop=end_slice projection=[Max Intensity]");
	
	//Save new image
	saveAs("PNG", folder + File.separator + title_without_extension + "_Z_projection_" + start_slice + "_" + end_slice);
	
	//Select main image
	selectImage(main_image);
	run("Next Slice [>]");
}

//------------ Stack images ---------------- 

//define input and output directories
input_dir=getDir("Get input directory (where Z projected images are)"); 
output_dir=getDir("Get outputdirectory (where you want to save film)");

list=getFileList(input_dir)
nGroup = lengthOf(list); //size of the image stack

//loop through the groups and make the image stack
for (i = 1; i < lengthOf(list); i+=nGroup) {

	//read images and make stacks
	run("Image Sequence...", "open=&input_dir number=nSlices starting=i sort"); 
	
	//Calibrate images
	slices = nSlices;
	run("Properties...", "channels=1 slices=slices frames=1 pixel_width=0.4044367 pixel_height=0.4044367 voxel_depth=2.7664000 frame=[30 sec]");
	
	//save and name files
	saveAs("TIFF", output_dir + title_without_extension + "_Z_projected_stack");

}