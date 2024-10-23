# VisualizeR

Visual Add-on Facilitating the Creation of Charts with ggplot2.

![R Version](https://img.shields.io/badge/R%3E%3D-4.3.3-blue) 
![CRAN](https://img.shields.io/badge/CRAN-Not%20Published-lightgrey) 
![Status](https://img.shields.io/badge/status-in%20development-orange) 
![License](https://img.shields.io/badge/license-MIT-lightgrey)

## Table of Contents
- [Installation](#installation)
- [Start with VisualizeR](#first-start)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Installation

You can install the latest version of `VisualizeR` from GitHub:

```R
# If you don't have the devtools package installed:
install.packages("devtools")

devtools::install_github("AlbaMqs/VisualizeR")
```

## First start

VisualizeR is very easy to use. After installing the package as described below, go to the **Addins** tab at the top left of RStudio and select **Vizualizer** from the displayed list. You can also launch VizualizeR directly from the console by entering the following command:

```R
visualizer::launchApp()

# You can directly include your dataframe as an argument to open it with VizualizeR.
visualizer::launchApp(df)
```

When you launch the tool, a pop-up window will appear (unless you've already provided your dataframe at the start). This first screen allows you to select the dataframe you want to work with. Simply choose one from the list and click "Validate."

Next, an empty plot will be displayed with a list of layers on the left side. Since no layers are added yet, the list will be empty. To create your first layer, click on **Add Layer** at the bottom left of the window. A new window will open, prompting you to choose the type of chart you'd like to add. Select the chart that best suits your needs to insert it into the plot.

Once your layer is created, it will appear in the list of layers on the left. By clicking on it, the settings panel will open on the right side of the window. Here, you can select variables for the x-axis and y-axis, specify color mappings, line types, and more. This panel also contains all the tools to adjust the aesthetic aspects of the chart.

You can also modify the global settings of your plot using the two buttons located at the bottom left, just above the **Add Layer** button. The **Global Theme** button allows you to adjust the overall aesthetics of the plot, such as fonts, colors, and title. The **Scales** button lets you customize the scales and facets of the plot.

Once you're satisfied with your plot, you can insert the code for its creation by clicking on **Insert Plot** at the bottom right of the displayed plot.

For more information, check the links provided in the next section.

## Documentation

For a more detailed setup, visit the following page: [Getting Started with VisualizeR](https://albamqs.github.io/visualizer/getting-started.html).

Detailed documentation for all chart types in `VisualizeR` can be found [here](https://albamqs.github.io/visualizer/).

## Contributing

Contributions are welcome! If you'd like to contribute to this package, please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Submit a pull request.

Please check our [contributing guidelines](https://albamqs.github.io/visualizer/contributing-guidelines.html) for more details.

## License

This package is licensed under the MIT License.  
For more details, please refer to the [LICENSE.md](./LICENSE.md) file in the root of the repository.  
You can also find more information in the [official MIT license summary](https://opensource.org/licenses/MIT) and the [full legal code](https://opensource.org/licenses/MIT).

## Acknowledgements

Special thanks to all contributors and to the open-source community.
