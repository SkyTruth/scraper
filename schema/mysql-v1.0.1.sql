# Add ingredient_weight column to handle new FracFocus chemical data provided by the PDF parser

ALTER TABLE `FracFocusParseChemical` ADD `ingredient_weight` double DEFAULT NULL after `hf_fluid_concentration`;

ALTER TABLE `FracFocusReportChemical` ADD `ingredient_weight` double DEFAULT NULL after `hf_fluid_concentration`;

