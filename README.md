# Personal Health Diary

Version: 0.1a
Date: 2013.07.26

Symphony CMS BP Version: 2013.04.29a
HTML5 Boilerplate Version: 3.0.6

## Overview
This is 

### Features
- Track ailments, well-being, sleep schedule, chronic illnesses, and more.
- Visualize your well-being and history.
- Mobile-first design so you can update your diaries from your mobile devices
- Ready for for multiple users (with caveats below).

## Privacy and Multi-user Support

The health diary is built to allow multiple users support, which allows you to share entry data such as meals and doctors. However, since all users have access to the Symphony backend, all users have access to other users' data. If you do wish to share your personal data, use your own installation.

As usual, be careful of how you send your data, use HTTPS.

## Roadmap

### v0.2
- Keep documentation updated with full install instructions and implemented features.
- First draft of API schema
- Color schemes for various forms of colorblindness.
- Visual cues and contrast animations to improve usability for colorblind users.

### v0.3
- Print stylesheets so you can print out part of your diaries to take to the doctor
- More styles and fleshed out view/ pages.

### v0.4
- Doctor log-in credentials, so they can also access the visualizations.

### v 0.5
- Importing from older versions. (There will be no breaking updates between 0.1 and 0.5, so `git pull` will be our friend.)
- Finalize Read API Schema v1
- Home screen icon

### v0.6
- Per diary comparison and visualizations

### v 0.7
- Better way to deal with user local time (currently xslt transformations completely depends on server time)

### v0.8
- More interactive visualizations for exploration (going beyond static visualizations)

### After Version 1.0
- Data visualization comparisons across users.
- Import data from third-party services such as FitBit and JawBone Up.
- Import basic weather data 
- Create Write API.

## License
HTML5 Boilerplate created by by Paul Irish and Divya Manian http://html5boilerplate.com
Compass-H5pb by Peter Gumeson https://github.com/sporkd/compass-h5bp

