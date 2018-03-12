### The library is the ObjC Version of [Skeleton](https://github.com/gonzalonunez/Skeleton)


<p align="center">
    <img src="logo.png" width="300" max-width="50%" alt="Skeleton" />
</p>

<p align="center">
    <a href="http://cocoapods.org/pods/OCSkeleton">
        <img src="https://img.shields.io/cocoapods/p/OCSkeleton.svg?style=flat" />
    </a>
    <a href="http://cocoapods.org/pods/OCSkeleton">
        <img src="https://img.shields.io/cocoapods/l/OCSkeleton.svg?style=flat" />
    </a>
    <a href="http://cocoapods.org/pods/OCSkeleton">
        <img src="https://img.shields.io/cocoapods/v/OCSkeleton.svg?style=flat" />
    </a>
</p>

OCSkeleton is an easy way to create sliding CAGradientLayer animations! It works great for creating skeleton screens:

![](./skeleton-logo-animation.gif)

## 👩‍💻 Usage

### import the OCSkeleton:  \#import \<OCSkeleton.h\>

#### You can use the *OCGradientLayer* directly:

```ObjC
@interface OCGradientLayer : CAGradientLayer

- (void)slideToDir:(OCDirection)direction animations:(void (^)(CAAnimationGroup *))group;

- (void)stopSliding;

@end

```

#### Or you can use the *OCGradientContainerView* to intergate with autolayout:

1. Make your view confrom to *OCGradientsOwner* protocol
2. Use the API    

```ObjC
@interface UIView (OCGradientsOwner)

- (void)slideToDir:(OCDirection)direction animations:(void (^)(CAAnimationGroup *))group;

- (void)stopSliding;

@end


```

Check out the example for more.


## 📚 Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## 🛠 Installation

OCSkeleton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'OCSkeleton'
```

## Author

mayqiyue, xu20121013@gmail.com

## License

OCSkeleton is available under the MIT license. See the LICENSE file for more info.
