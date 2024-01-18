# FSCoverFlow

[![Watch the Video](https://github.com/FadelSultan/MyFiles/blob/master/FSCoverFlowPhoto.png)](https://youtube.com/shorts/4dGCU8w2wiw?feature=share)

FSCoverFlow is a cutting-edge image gallery library, designed to provide a seamless and engaging experience for effortlessly showcasing pictures. This library allows users to easily upload and display a multitude of images from the internet, creating a visually appealing presentation within the application.

## Features

- **Reflection:** a beautiful reflection feature, adding an elegant touch to the displayed images by seamlessly incorporating reflective elements, enhancing their visual appeal.
  
- **Display Type:** There are three display modes for photos: Normal, Clip, and Slide, each with its unique presentation style.

  
| Type | Description |
|----------|----------|
| normal | The images are displayed conventionally without any effects, with the image appearing in the center and parts of the previous and next images at the edges. |
| Clip | Similar to the conventional display, there is an added effect during navigation between images. The images are presented in a standard manner, with the central display of each image and portions of the preceding and succeeding images visible at the edges.|
| Slid | It involves showcasing images in a manner resembling their entry from one side and exit from the other side.|



## Getting Started

To get started with FSCoverFlow, follow these simple steps:

1. Add the package to your project.
2. Import the library to the class.
   
```swift
import FSCoverFlow
```

3. Add this code to your project
```swift
CoverFlowView(
    enableReflection:true ,
    displayType: .normal ,
    images: viewModel.imagesList,
    itemWidth: 300 )

```


## In conclusion
I welcome any inquiries or communication. Feel free to reach out to me for further information or collaboration. I look forward to connecting with you.

fadel.sultan@gmail.com





