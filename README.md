# README
<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
[![Stargazers][stars-shield]][stars-url]
-->

<!-- PROJECT LOGO -->
<br />
<div align="center">

  [![Contributors][contributors-shield]][contributors-url]
  [![Forks][forks-shield]][forks-url]
  [![Issues][issues-shield]][issues-url]

  <a href="https://github.com/josephhilby/lunch_and_learn">
    <img src="lib/images/banner.png" alt="Logo" width="100%">
  </a>

  <h3 align="center">
    <br />
    <a href="https://github.com/josephhilby/lunch_and_learn/issues">Report Bug</a>
    ·
    <a href="https://github.com/josephhilby/lunch_and_learn/issues">Request Feature</a>
  </h3>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#acknowledgments">Acknowledgments</li>
    <li><a href="#license">License</a></li></a>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

<div align="center">

  [![Product Name Screen Shot][product-screenshot]](https://example.com)

</div>

Board with your recipe book? Want to step out of your comfort zone and taste something new? This is for you.

***Lunch and Learn*** is an app that will let you find your new favorite recipe by country of origin. After you are done cooking ***Lunch and Learn*** will look up some edutainment to watch while you enjoy your new dish.

Sign up and get started!

<p align="right">(<a href="#README">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Web Usage

This is a Ruby on Rails web application that was made for the chrome browser and for use with Google OAuth. You will need the following:

* Google Chrome
* Google account

To get started, follow the link below and register with your Google account. Once you are registered you will be able to:

* Search for recipes by country
* Have ***Lunch and Learn*** select a country for you
* Play an educational video on that select county.

### Local Installation

This application was made with the following:

* ruby '2.7.4'
* rails '5.2.8'

To install and run on your personal computer you will need to do the following:

1. Get a free API Key at [https://example.com](https://example.com)
2. Fork and clone the repo to your local machine
3. Install gems

   ```sh
   $ bundle install
   $ rails db:{drop,create,migrate,seed}
   $ bundle exec figaro install
   ```

4. Enter your API in the `config/application.yml` file

   ```yml
   api-key-name: <YOUR API KEY HERE>
   ```

5. Start your rails server in the root directory

    ```sh
    $ rails s
    ```

6. Continue with endpoint use

<p align="right">(<a href="#README">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

Main Goal(s)
* [ ] Complete MVP
* [ ] Deploy to Heroku

Stretch Goals
* [ ] Add 400 level status codes and prams check
* [ ] Add DELETE for favorite(s) (DELETE '/api/v1/favorites)
* [ ] Utilize Cashing OR Background Workers
* [ ] Implement Google OAuth

See the [open issues](https://github.com/josephhilby/lunch_and_learn/issues) for a full list of proposed features (and known issues).
### Learning Goals
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires and authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock)

### Evaluation Rubric
1. Technical Presentation
    * Demo understanding of learning goals
    * Demo functionality with Postman and live demo
    * Discuss technical quality & organization of code
    * Discuss test coverage, happy path, sad path, and edge cases

2. Feature Delivery
    * Complete all MVP features as directed [here](https://backend.turing.edu/module3/projects/lunch_and_learn/requirements)
    * Complete 3 of 4 stretch goals

3. Technical Quality
    * Demonstrate good use of abstraction and encapsulation in Facades and Services
    * Demonstrate good use of Model, View, Controller (MVC) design principles

4.  Testing
    * Minimum of 90% testing coverage
    * Include all 'happy path' and 'sad path' testing
    * Include use of VCR and/or Webmock
    * Testing checks for presence of data in payload and data type

<p align="right">(<a href="#README">back to top</a>)</p>

<!-- BUILT WITH -->
## Built With

Lunch and Learn is a ***Ruby on Rails*** web application hosted on Heroku.


<br />
<div align="center">
  <img src="lib/images/tech-stack.png" alt="Tech-Stack" width="70%">
</div >

<p align="right">(<a href="#README">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<div align="center">
  <table>
    <tr>
      <td><img src="https://avatars.githubusercontent.com/u/108031077?s=120&v=4"></td>
    </tr>
    <tr>
      <td>Joseph Hilby</td>
    </tr>
    <tr>
      <td>
        <a href="https://github.com/josephhilby">GitHub</a><br>
        <a href="https://www.linkedin.com/in/josephmhilby/">LinkedIn</a>
      </td>
    </tr>
  </table>
</div>

<p align="right">(<a href="#README">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Do you have a better & cooler way of doing what I did? Your contribution would be **greatly appreciated**.

Please fork the repo, create your branch, and create a pull request. You can also simply open an issue with the tag "enhancement".

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Thanks again!

<p align="right">(<a href="#README">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Turing School of Software Design: [https://turing.edu/](https://turing.edu/)
Best-README-Template: [https://github.com/othneildrew/Best-README-Template](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#README">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License.

<p align="right">(<a href="#README">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/josephhilby/lunch_and_learn.svg?style=for-the-badge
[contributors-url]: https://github.com/josephhilby/lunch_and_learn/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/josephhilby/lunch_and_learn.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/josephhilby/lunch_and_learn/network/members
[issues-shield]: https://img.shields.io/github/issues/josephhilby/lunch_and_learn.svg?style=for-the-badge
[issues-url]: https://github.com/josephhilby/lunch_and_learn/issues
[product-screenshot]: lib/images/screenshot.png