<a name="readme-top"></a>

<div align="center">
  <h3><b>Pawsitive</b></h3>
</div>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
    - [🛠 Built With](#built-with)
        - [Tech Stack](#tech-stack)
        - [Key Features ](#key-features-)
- [💻 Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)


# Pawsitive <a name="about-project"></a>

This App is a pet intended to connect pet owners and care givers who live within a 5 - 10 mile radius, The two types of service offered are day care which hourly from 7am - 8pm and boarding which could be as long as 1 week. 

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Ruby</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/">Ruby</a></li>
  </ul>
</details>

<details>
<summary>Rails</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby</a></li>
  </ul>
</details>
<details>
<summary>PostgreSQL</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- [ ] Create skeleton app

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

```sh
 gem install ruby
```
```sh 
 gem install rails
```
```sh
  gem install foreman
```
### Setup
Clone this repository to your desired folder:
```sh
  cd folder
  git clone git@github.com:chingu-voyages/v49-tier3-team-31.git
```
### Install

Install this project with:
```sh
  cd my-project
  bundle install
```
2. Configure the database.yml file with your database credentials
```
    development:
        <<: *default
        database: your_database_name
        username: your_username
        password: your_password
        port: 5432
         
    test:
        <<: *default
        database: your_database_name
        username: your_username
        password: your_password
        port: 5432
```
3. Set up the database

```
  rails db:create
  rails db:migrate
```

4. Start the server in your favorite terminal:

```
  rails server or bin/dev
```



<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Lincoln**
- GitHub: [lincoln1883](https://github.com/lincoln1883)
- LinkedIn : [lincoln-gibson](https://linkedin.com/in/lincoln-gibson)

👤 **Gladdy**
- GitHub: [gladdy17](https://github.com/Gladdy17)
- LinkedIn : [gladdy](https://linkedin.com/in/)

👤 **Jonatan**
- GitHub: [jcidp](https://github.com/jcidp)
- LinkedIn : [jcidp](https://linkedin.com/in/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>


- **Add authorization rules.**
- **Add API endpoints.**
- **API documentation.**
- **Creating a data model.**
- **Validations and Model specs.** 
- **Processing data in models.**
- **Setup and controllers.**
- **Controllers specs.**
- **Views.**
- **Forms.**
- **Add Devise.**
- **Add AWS S3 config**
- **Add location map**


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/lincoln1883/blog-app/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

- Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- Thank you Microverse indeed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>
This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>