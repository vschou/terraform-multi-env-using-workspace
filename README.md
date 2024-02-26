# terraform-multi-env-using-workspace
script for aws multi environments using workspace
# Commands to use this repo
**[1] Cloning this terraform repo** 

 $ **git clone <REPO_URL>**  
 
**[2] opening the repo folders in any IDE & running the following commands**  

 $ **cd environments/dev/**       #_changing directory to 'dev' environment   
 $ **terraform workspace list**   #_checking the workspace list    
 $ **terraform workspace new dev**   #_Creating 'dev' workspace  
 $ **terraform workspace list**      #_Listing the all available workspaces here  
 $ **cd ..**  
 $ **cd stage/**  
 $ **terraform workspace list**   #_checking the workspace list  
 $ **terraform workspace new stage**   #_Creating 'stage' workspace  
 $ **terraform workspace list**      #_Listing the all available workspaces here  
 $ **cd ..**  
 $ **cd prod/**  
 $ **terraform workspace list**   #_checking the workspace list  
 $ **terraform workspace new prod**   #_Creating 'prod' workspace  
 $ **terraform workspace list**      #_Listing the all available workspaces here  
 
 **[3] Using the terraform environments**  
 
 $ **cd environments/prod**  
 $ **terraform init**       #_initializing the terraform & installing provider dependencies  
 $ **terraform fmt**        #_Formatting the terraform script  
 $ **terraform validate**   #_Checking for validation  
 $ **terraform plan -var-file='prod.tfvars' -var='provider_alias=prod'**  #_checking the script deployment plan  
 $ **terraform apply -var-file='prod.tfvars' -var='provider_alias=prod'** #_Applying the changes  
 **[Note:  
   (1) Install terraform  
   (2) Similarly, Use the other 'dev' & 'stage' environments also  
   (3) For more script utilizing purpose, use this Official URL for Documentation "https://registry.terraform.io/providers/hashicorp/aws/latest/docs"  
   (4) Happing Learning!!!**  
