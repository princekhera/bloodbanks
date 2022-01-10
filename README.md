# bloodbanks

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

**1.1.** Home page of application

We have provided a drawer for navigation throughout the application and a picture displaying information about donation and motivation for potential donors. Also the eligibility of blood donors, who all are eligible for donating blood . 

**1.2.** Donor

User’s who are willing to donate blood can post their details, which will get stored in the database. We have developed an application in which donors can register with the following attributes ( Name, Age, Contact No, State, District, City, Blood Group ) stored in the real time synchronised data in the firebase across clients. 

**1.3.** Acceptor

Users can register themselves to the application and their requirements like blood type, state, district, city.
Users who need blood can search by ( Blood Group, State ) and contact them. Users who complete the process of accepting blood, their data is stored in the database.

**1.4.** Search

Users can search donors through their blood Group, state, district from the database.
Users can search blood banks in their location using blood bank api from data.gov.in.

**1.5** New Blood Bank Registration

New Blood Banks can register themselves on the application by providing details like Name, State, District, City, Address, Contact number. Once they register they can also check them on Search New Blood Banks.

**2.1.** Design
Material Design is a visual language which helps us make beautiful design for user to easily navigate through application and have easy to use experience
Designing the application I’ve used 2 different types of cluster, first is authenticate, second is home.

Authenticate Cluster 

It is a stateful widget which returns a scaffold that includes AppBar and Flat Button.
Inside the scaffold body, we have a container which comprises two Text Form Fields for user input then we have a Raised Button for users to submit.

**Figure 1:**  <img src="https://user-images.githubusercontent.com/29550470/148842594-e69f2c60-ee4a-4843-95e0-1a8a377d83a7.png" width=20% height=20%>  <img src="https://user-images.githubusercontent.com/29550470/148842598-ae930f5a-235c-497b-b630-51a7501ff16b.png" width=20% height=20%>

Home Cluster

This is the main cluster of our application, which comprises six screens in the drawer which are helpful to navigate through the app rapidly.

On the Drawer first we have a Donor screen then Search Donors screen then Acceptor screen then Search Blood Banks screen then Register New Blood bank screen then search what you registered earlier and then we have a close drawer option.
 

**Figure 2:** <img src="https://user-images.githubusercontent.com/29550470/148842601-a53b8ba9-b855-4240-8ca5-eedbd121697e.png width=20% height=20%>

Donor Screen 
Inside the donor screen we have a stateful widget which returns a scaffold. Inside the scaffold we have a container which comprises seven Text Form Fields and a Raised Button.


**Figure 3:** <img src="https://user-images.githubusercontent.com/29550470/148842602-acacec14-a305-4a49-ad94-f78418386a77.png width=20% height=20%>



Search Donors
Inside Search Donors we have a stateful widget which returns a scaffold having padding and inside padding we have two Text Form Fields and a Raised Button.

   
**Figure 4:**  <img src="https://user-images.githubusercontent.com/29550470/148842605-8d433ccf-0774-4e50-a7b7-e92a68765c8a.png width=20% height=20%>  <img src="https://user-images.githubusercontent.com/29550470/148842607-1f4392a8-4813-4416-a3f5-6b7e79a4cb2b.png width=20% height=20%>

Text values from these fields are passed to the next screen which results in a custom UI card widget.


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
