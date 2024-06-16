<a name="readme-top"></a>

<div align="center">
  <h3><b>Pawsitive</b></h3>
</div>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
    - [🛠 Built With](#built-with)
        - [Tech Stack](#tech-stack)
        - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run Tests](#run-tests)
    - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

# Pawsitive <a name="about-project"></a>

Pawsitive is an app designed to connect pet owners and caregivers who live within a 5-10 mile radius. The app offers two types of services: daycare, which is provided hourly from 7 AM to 8 PM, and boarding, which can last up to one week.

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
    <li><a href="https://rubyonrails.org/">Rails</a></li>
  </ul>
</details>

<details>
<summary>PostgreSQL</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Create Skeleton App:** Initial setup of the application structure.
- **Add Authorization Rules:** Implementing access control mechanisms.
- **Add API Endpoints:** Creating endpoints for API interaction.
- **API Documentation:** Documenting API endpoints and usage.
- **Creating a Data Model:** Designing the database schema.
- **Validations and Model Specs:** Implementing validations and writing tests for models.
- **Processing Data in Models:** Handling data logic within models.
- **Setup and Controllers:** Setting up controllers and routes.
- **Controllers Specs:** Writing tests for controllers.
- **Views:** Developing user interface components.
- **Forms:** Creating forms for user input.
- **Add Devise:** Implementing user authentication.
- **Add AWS S3 Config:** Configuring AWS S3 for file storage.
- **Add Location Map:** Integrating a map to display locations.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

```sh
gem install ruby
gem install rails
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

### Configuration

Configure the `database.yml` file with your database credentials:

```yaml
development:
  <<: *default
  database: pawsitive
  username: your_username
  password: your_password
  port: 5432

test:
  <<: *default
  database: pawsitive
  username: your_username
  password: your_password
  port: 5432
```

### Database Setup

Set up the database:

```sh
rails db:create
rails db:migrate
```

### Usage

Start the server in your favorite terminal:

```sh
rails server
# or
bin/dev
```

### Run Tests <a name="run-tests"></a>

To run tests, execute:

```sh
rspec
```

### Deployment <a name="deployment"></a>

Instructions for deploying the app will be provided in future updates.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Lincoln**
- GitHub: [lincoln1883](https://github.com/lincoln1883)
- LinkedIn: [Lincoln Gibson](https://linkedin.com/in/lincoln-gibson)

👤 **Gladdy**
- GitHub: [Gladdy17](https://github.com/Gladdy17)
- LinkedIn: [Gladdy](https://linkedin.com/in/gladdy)

👤 **Jonatan**
- GitHub: [jcidp](https://github.com/jcidp)
- LinkedIn: [Jonatan](https://linkedin.com/in/jcidp)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] User profile customization.
- [ ] In-app messaging between pet owners and caregivers.
- [ ] Real-time booking updates.
- [ ] Advanced search filters.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/chingu-voyages/v49-tier3-team-31/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show Your Support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgements <a name="acknowledgements"></a>

- Special thanks to the Chingu team for their support and resources.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>