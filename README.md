# text-simplification-slovene

To increase the accessibility and diversity of easy reading in Slovenian, we created a prototype system that automatically simplifies texts. This is the first system for automatically converting Slovenian sentences and texts into a simpler form. We have prepared a dataset for the Slovenian language that contains aligned simple and complex sentences, which can be used for further development of models for simplifying texts in Slovenian. We use the T5 model for the Slovenian language, called SloT5, developed by Ulčar and Robnik-Šikonja (2022) for the task of denoising and span corruption: https://huggingface.co/cjvt/legacy-t5-sl-small. We use the HuggingFace library. To find the optimal values of hyperparameters and evaluate the performance of the system, we used automatic measures ROUGE and BERTScore. 

**Installation**

- install Python 3 
- install HuggingFace library (and any other libraries needed)
- install pretrained T5 model https://huggingface.co/cjvt/legacy-t5-sl-small
- download data testna.json, evalvacijska.json and ucna.json
- run t5-lahkobranje.sh to reproduce the results of the paper Gorenc_magistrsko-delo.pdf

Examples of our simplified texts can be seen in demo.rtf.
______________________

Za povečanje dostopnosti in raznovrstnosti lahkega branja v slovenščini, smo izdelali prototip sistema, ki avtomatsko poenostavlja besedila. To je prvi sistem za samodejno pretvarjanje slovenskih povedi in besedil v enostavnejšo obliko. Pripravili smo podatkovno množico za slovenski jezik s poravnanimi enostavnimi in kompleksnimi stavki, ki se jo bo lahko uporabilo za nadaljne razvijanje modelov za poenostavljanje besedil v slovenščini. Uporabljamo T5 model za slovenski jezik, poimenovan SloT5, ki sta ga izdelala Ulčar in Robnik-Šikonja (2022) za nalogi razšumljanje in maskiranje delov besedila: https://huggingface.co/cjvt/legacy-t5-sl-small. Uporabimo knjižnico HuggingFace. Za iskanje optimalnih vrednosti hiperparametrov in evalvacijo uspešnosti sistema smo uporabili avtomatske mere ROUGE in BERTScore.

**Inštalacija**

- inštaliraj Python 3 
- inštaliraj HuggingFace library (in morebitne druge knjižnice)
- inštaliraj prednaučen T5 model https://huggingface.co/cjvt/legacy-t5-sl-small
- prenesi podatkovne množice testna.json, evalvacijska.json in ucna.json
- da bi ponovili rezultate iz Gorenc_magistrsko-delo.pdf, zaženite t5-lahkobranje.sh 

Primeri naših avtomatskih poenostavitev so v demo.rtf.
