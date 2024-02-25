//
//  QuestionsService.swift
//  TechQuiz
//
//  Created by Admin on 20.02.24.
//

import Foundation

class QuestionsService{
    
    static func easyQuestions() -> [QuestionsModel] {
        var questionsArray: [QuestionsModel] = []
        
        questionsArray.append(QuestionsModel(id: 0, question: "Sa bita ne nje byte?", correctAnswer: "8", wrongAnswer1: "16", wrongAnswer2: "1", wrongAnswer3: "64"))
        questionsArray.append(QuestionsModel(id: 1, question: "Cili nga keta konsiderohet softuer?", correctAnswer: "XCode", wrongAnswer1: "Smartphone", wrongAnswer2: "PC", wrongAnswer3: "Tablet"))
        questionsArray.append(QuestionsModel(id: 2, question: "Cili nga keta eshte Sistem Operativ?", correctAnswer: "Linux", wrongAnswer1: "Internet Explorer", wrongAnswer2: "mac", wrongAnswer3: "Zana"))
        questionsArray.append(QuestionsModel(id: 3, question: "Cila nga keto pajisje eshte pajisje hyrese?", correctAnswer: "Tastatura", wrongAnswer1: "Monitori", wrongAnswer2: "Printeri", wrongAnswer3: "Skaneri"))
        questionsArray.append(QuestionsModel(id: 4, question: "Cilin numer decimal e perfaqeson F ne hexadecimal?", correctAnswer: "15", wrongAnswer1: "16", wrongAnswer2: "7", wrongAnswer3: "64"))
        questionsArray.append(QuestionsModel(id: 5, question: "JavaScript eshte perditesim i gjuhes programuese Java?", correctAnswer: "Jo", wrongAnswer1: "Po", wrongAnswer2: "Ne disa aspekte", wrongAnswer3: "Jo, vlen e kunderta"))
        questionsArray.append(QuestionsModel(id: 6, question: "HTTP eshte shkurtese per: ", correctAnswer: "HyperText Transfer Protocol", wrongAnswer1: "HyperText Markup Language", wrongAnswer2: "HyperText Transport Protocol", wrongAnswer3: "HighlightText Topics Protocol"))
        questionsArray.append(QuestionsModel(id: 7, question: "CTRL + C (cmd + C) eshte komande per:", correctAnswer: "Copy", wrongAnswer1: "Paste", wrongAnswer2: "Cut", wrongAnswer3: "Build"))
        questionsArray.append(QuestionsModel(id: 8, question: ".pdf eshte prapashtese per:", correctAnswer: "Dokumente", wrongAnswer1: "Imazhe", wrongAnswer2: "Video", wrongAnswer3: "Audio"))
        questionsArray.append(QuestionsModel(id: 9, question: "Cila nga keto eshte gjuhe programuese?", correctAnswer: "Python", wrongAnswer1: "HTML", wrongAnswer2: "CSS", wrongAnswer3: "Node.js"))
        questionsArray.append(QuestionsModel(id: 10, question: "Cili nga keta eshte nje \"Web Browser\"?", correctAnswer: "Safari", wrongAnswer1: "Instagram", wrongAnswer2: "TikTok", wrongAnswer3: "YouTube"))
        
        return questionsArray
    }
    
    static func mediumQuestions() -> [QuestionsModel] {
        var questionsArray: [QuestionsModel] = []
        questionsArray.append(QuestionsModel(id: 0, question: "Cila shtrese me rradhe ne OSI eshte Network Layer?", correctAnswer: "3", wrongAnswer1: "10", wrongAnswer2: "1", wrongAnswer3: "4"))
        questionsArray.append(QuestionsModel(id: 1, question: "Sipas ligjit te Moore, numri i transistoreve ne nje qark te integruar per cdo 2 vite:", correctAnswer: "Dyfishohet", wrongAnswer1: "Pergjysmohet", wrongAnswer2: "Katerfishohet", wrongAnswer3: "Nuk ndryshon"))
        questionsArray.append(QuestionsModel(id: 2, question: "Cili nga keto probleme konsiderohet NP Problem?", correctAnswer: "Travelling Salesman", wrongAnswer1: "Sortimi", wrongAnswer2: "String Matching", wrongAnswer3: "Faktorieli"))
        questionsArray.append(QuestionsModel(id: 3, question: "Cili nga keto funksione eshte \"hashing function\"?", correctAnswer: "SHA-256", wrongAnswer1: "AES", wrongAnswer2: "Salt", wrongAnswer3: "Triple-DES"))
        questionsArray.append(QuestionsModel(id: 4, question: "Cila nga keto metodologji per zhvillim te softuerit eshte metodologji Agile?", correctAnswer: "SCRUM", wrongAnswer1: "Waterfall", wrongAnswer2: "V-Model", wrongAnswer3: "Big Bang"))
        questionsArray.append(QuestionsModel(id: 5, question: "Cili nga keta shkurton dhe paralelizon ekzekutimin e nje procesi?", correctAnswer: "Threads", wrongAnswer1: "CPU", wrongAnswer2: "Clock", wrongAnswer3: "Virtual Memory"))
        questionsArray.append(QuestionsModel(id: 6, question: "Kotlin eshte gjuha programuese per: ", correctAnswer: "Android", wrongAnswer1: "iOS", wrongAnswer2: "Windows", wrongAnswer3: "Harduer"))
        questionsArray.append(QuestionsModel(id: 7, question: "Cila nga keto mund te jete veti funksionale e softuerit?", correctAnswer: "Moduli per Login", wrongAnswer1: "Lehtesia ne perdorim", wrongAnswer2: "Response time", wrongAnswer3: "Throughput"))
        questionsArray.append(QuestionsModel(id: 8, question: "Komanda cd ne Linux perdoret per: ", correctAnswer: "Kalimin ne nje path tjeter", wrongAnswer1: "Kalimin ne nje path tjeter vetem nese eshte relativ", wrongAnswer2: "Shfaq elementet ne direktoriumin aktual", wrongAnswer3: "Shton nje direktorium te ri"))
        questionsArray.append(QuestionsModel(id: 9, question: "Kjo klause perdoret per te paraqitur nje numer te caktuar te te dhenave nga nje query prej databazes: ", correctAnswer: "LIMIT", wrongAnswer1: "STOP AT", wrongAnswer2: "END IN", wrongAnswer3: "BREAK"))
        questionsArray.append(QuestionsModel(id: 10, question: "Cili nga keta konsiderohet kompleksitet me i mire kohor per nje algoritem?", correctAnswer: "O(log(n))", wrongAnswer1: "O(nlog(n))", wrongAnswer2: "O(n!)", wrongAnswer3: "O(n)"))
        
        return questionsArray
    }
    
    static func hardQuestions() -> [QuestionsModel] {
        var questionsArray: [QuestionsModel] = []
        questionsArray.append(QuestionsModel(id: 0, question: "Ky lloj i testimit, teston performancen e nje softueri:", correctAnswer: "Spike Testing", wrongAnswer1: "Security Testing", wrongAnswer2: "Grey-Box Testing", wrongAnswer3: "Compatibility Testing"))
        questionsArray.append(QuestionsModel(id: 1, question: "Mundeson paralelizmin e tasqeve: ", correctAnswer: "Multicore multiprocessing", wrongAnswer1: "Multitasking", wrongAnswer2: "CPU Utilization", wrongAnswer3: "Memory Utilization"))
        questionsArray.append(QuestionsModel(id: 2, question: "Algoritmet asimetrike nuk perdoren per enkriptim te sasise se madhe te te dhenave sepse: ", correctAnswer: "Operacionet matematike per enkriptim marrin shume kohe", wrongAnswer1: "Me brute force algoritmet asimetrike thyhen lehte", wrongAnswer2: "Eshte zbuluar metoda per thyerjen e tyre", wrongAnswer3: "Algorimet simetrike i mbrojne te dhenat me mire"))
        questionsArray.append(QuestionsModel(id: 3, question: "Cili nga keto probleme konsiderohet NP Complete Problem?", correctAnswer: "Knapsack Problem", wrongAnswer1: "String Matching", wrongAnswer2: "Boolean Satisfability", wrongAnswer3: "Fibonacci"))
        questionsArray.append(QuestionsModel(id: 4, question: "Shkurtesa UTP nenkupton: ", correctAnswer: "Unshielded Twisted Pair", wrongAnswer1: "User Transfer Protocol", wrongAnswer2: "UpperText Protocol", wrongAnswer3: "Unwrapped Twisted Pair"))
        questionsArray.append(QuestionsModel(id: 5, question: "Cila konfigurim i tranisitoreve mundeson pune me efikase?", correctAnswer: "CMOS", wrongAnswer1: "PMOS", wrongAnswer2: "NMOS", wrongAnswer3: "Asnjera"))
        questionsArray.append(QuestionsModel(id: 6, question: "Cili nga pohimet per JSON dhe GSON eshte i sakte?", correctAnswer: "GSON eshte librari e Java", wrongAnswer1: "JSON eshte librari e Java", wrongAnswer2: "GSON d.m.th JavaScript Object Notation", wrongAnswer3: "Asnjera"))
        questionsArray.append(QuestionsModel(id: 7, question: "Cila nga keto nuk ben pjese ne kater shtyllat e OOP?", correctAnswer: "Modifikatoret", wrongAnswer1: "Abstraksioni", wrongAnswer2: "Enkapsulimi", wrongAnswer3: "Polimorfizmi"))
        questionsArray.append(QuestionsModel(id: 8, question: "Cili nga pohimet eshte i sakte?", correctAnswer: "Asnjeri", wrongAnswer1: "Bubble sort eshte algoritmi me i shpejte i sortimit", wrongAnswer2: "Nje IPv4 adrese eshte 64 biteshe", wrongAnswer3: "HTML perdoret per stilizim te aplikacioneve desktop"))
        questionsArray.append(QuestionsModel(id: 9, question: "Cila nga pohimet nuk eshte i sakte?", correctAnswer: "Nje mikroprocesor mund te permbaje mikrokontroller", wrongAnswer1: "Gjuha C mund te perdoret per krijimin e embedded systems", wrongAnswer2: "DES nuk konsiderohet algoritem i sigurte enkriptimi", wrongAnswer3: "Asnjera"))
        questionsArray.append(QuestionsModel(id: 10, question: "ALU perdoret per: ", correctAnswer: "Kryerjen e operacioneve aritmetiko-logjike", wrongAnswer1: "Ekzekutimin e instruksioneve", wrongAnswer2: "Dhenie te kontrollit", wrongAnswer3: "Mbledhjen e dy numrave 4-bitesh"))
        
        return questionsArray
    }
}
