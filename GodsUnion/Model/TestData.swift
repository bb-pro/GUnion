//
//  TestData.swift
//  GodsUnion
//
//  Created by 1 on 27/01/25.
//

import Foundation

struct Question {
    let question: String
    let firstAnswer: String
    let secondAnswer: String
    let thirdAnswer: String
}

struct TestData {
    let questions: [Question]
    let finales: [String]
    
    static func fetchTestData() -> [TestData] {
        [
            TestData(questions: [
                Question(question: "Apollo asks you to solve a riddle to test your wisdom.",
                         firstAnswer: "Ask Athena for a hint to solve the riddle.",
                         secondAnswer: "Try to solve the riddle on your own using intuition.",
                         thirdAnswer: "Seek the muses for inspiration and help in solving the riddle."),
                Question(question: "Apollo asks you to find a hidden artifact that will help return inspiration to humans.",
                         firstAnswer: "Explore sacred groves and temples to find the artifact.",
                         secondAnswer: "Consult the oracle at Delphi for a clue on where to find the artifact.",
                         thirdAnswer: "Ask Hermes for help, using his cunning and resourcefulness to find the artifact."),
                Question(question: "Apollo suggests organizing a music festival to inspire people.",
                         firstAnswer: "Invite the best musicians and poets from all over Greece.",
                         secondAnswer: "Organize competitions among musicians to find the most talented.",
                         thirdAnswer: "Hold the festival in sacred places to give it special significance."),
                Question(question: "Apollo asks for your help in creating a new melody that will inspire people.",
                         firstAnswer: "Seek the muses for inspiration and help in creating the melody.",
                         secondAnswer: "Research ancient texts and legends to find inspiration for the melody.",
                         thirdAnswer: "Invite talented musicians to help create the melody."),
                Question(question: "Apollo suggests creating a new myth that will inspire people.",
                         firstAnswer: "Seek the muses for inspiration and help in creating the myth.",
                         secondAnswer: "Research ancient legends and stories to find inspiration for the new myth.",
                         thirdAnswer: "Invite talented poets and writers to help create the myth."),
                Question(question: "Apollo asks for your help in creating a new work of art that will inspire people.",
                         firstAnswer: "Seek the muses for inspiration and help in creating the artwork.",
                         secondAnswer: "Research ancient artworks to find inspiration for the new creation.",
                         thirdAnswer: "Invite talented artists and sculptors to help create the artwork."),
                Question(question: "Apollo is pleased with your efforts and offers you a choice to further inspire humanity:",
                                        firstAnswer: "Establish a permanent academy of arts where mortals can learn and create.",
                                        secondAnswer: "Create a series of traveling festivals that will bring joy and inspiration to all corners of Greece.",
                                        thirdAnswer: "Found a new religious order dedicated to spreading the wisdom and beauty of the arts.")
            ],
                     finales: ["After the successful completion of the trials, the gods and mortals celebrate together on Olympus. Harmony and unity are restored, and all inhabitants of the world live in peace and accord. Zeus, pleased with the outcome, promises to continue supporting these connections so that such festivities become regular.",
                               "The trials conclude, but not all participants are satisfied with the results. Some gods and mortals feel that their efforts were not adequately appreciated. Zeus realizes that there is still much work to be done to fully restore harmony and decides to continue efforts to strengthen the bonds.",
                               "The trials are successful, but hidden conflicts and grievances between the gods and mortals are revealed in the process. Zeus uses this as an opportunity to resolve long-standing disputes and build trust. As a result, harmony is restored, but everyone understands that maintaining unity requires constant effort."]
                    ),
            TestData(questions: [
                Question(question: "Demeter asks for your help in restoring the harvest in the fields.",
                         firstAnswer: "Choose which fields to plant first to ensure the best harvest.",
                         secondAnswer: "Consult local farmers for advice on which crops to plant.",
                         thirdAnswer: "Invite the wind gods to help create favorable conditions for crop growth."),
                Question(question: "Demeter asks for your help in fighting pests that are destroying the harvest.",
                         firstAnswer: "Seek help from the nature gods in fighting pests.",
                         secondAnswer: "Research ancient methods of pest control to find effective ways.",
                         thirdAnswer: "Invite local residents to help fight pests."),
                Question(question: "Demeter asks for your help in creating a new variety of grain that will be drought-resistant.",
                         firstAnswer: "Seek help from the gods of science and knowledge in creating a new variety of grain.",
                         secondAnswer: "Research ancient breeding methods to find inspiration for creating a new variety.",
                         thirdAnswer: "Invite local scientists and agronomists to help create a new variety of grain."),
                Question(question: "Demeter asks for your help in creating a new irrigation method that will be effective in drought conditions.",
                         firstAnswer: "Seek help from the water and rain gods in creating a new irrigation method.",
                         secondAnswer: "Research ancient irrigation methods to find inspiration for creating a new method.",
                         thirdAnswer: "Invite local engineers and hydrologists to help create a new irrigation method."),
                Question(question: "Demeter asks for your help in creating a new method of storing the harvest that will prevent it from spoiling.",
                         firstAnswer: "Seek help from the gods of storage and preservation in creating a new method of storing the harvest.",
                         secondAnswer: "Research ancient methods of storing the harvest to find inspiration for creating a new method.",
                         thirdAnswer: "Invite local storage and logistics specialists to help create a new method of storing the harvest."),
                Question(question: "Demeter asks for your help in creating a new method of distributing the harvest that will be fair and efficient.",
                         firstAnswer: "Seek help from the gods of justice and equality in creating a new method of distributing the harvest.",
                         secondAnswer: "Research ancient methods of distributing the harvest to find inspiration for creating a new method.",
                         thirdAnswer: "Invite local economists and logistics specialists to help create a new method of distributing the harvest."),
                Question(
                   question: "Demeter is pleased with your efforts and offers you a choice to further ensure abundance:",
                   firstAnswer: "Establish a network of agricultural schools to teach advanced farming techniques.",
                   secondAnswer: "Create a system of public granaries to store and distribute food during times of need.",
                   thirdAnswer: "Found a new cult dedicated to the worship of Demeter to ensure her continued blessings.")
            ],
                     finales: ["After the completion of the first trials, Zeus decides that this is just the beginning. He announces even more challenging new trials that will be held regularly. The gods and mortals enthusiastically accept the challenge, knowing that it will help them become stronger and wiser.",
                              "New trials begin, but not everyone is ready for such difficulties. Some participants start to doubt their abilities and strengths. Zeus sees this and decides to provide additional support and mentorship to help everyone overcome the challenges.",
                              "The new trials are successful, but they reveal new threats and challenges that need to be addressed. Zeus understands that the trials must continue to prepare everyone for future difficulties. He announces the creation of a permanent council that will develop and coordinate new trials."]
                    ),
            TestData(questions: [
                Question(question: "The mortals complain about the lack of festivals and entertainment.",
                         firstAnswer: "Organize a grand festival with music, dance, and theatrical performances.",
                         secondAnswer: "Build a new temple in honor of the gods so that people can pray and find solace.",
                         thirdAnswer: "Hold sporting competitions so that people can have fun and showcase their skills."),
                Question(question: "The mortals complain about the lack of food and resources.",
                         firstAnswer: "Seek Demeter's help in restoring the harvest and ensuring abundance.",
                         secondAnswer: "Organize trade fairs so that people can exchange goods and resources.",
                         thirdAnswer: "Create systems for storing and distributing food to ensure everyone is provided for."),
                Question(question: "The mortals complain about the lack of justice and order.",
                         firstAnswer: "Seek Zeus's help in establishing fair laws and order.",
                         secondAnswer: "Appoint wise and just judges to resolve disputes and conflicts.",
                         thirdAnswer: "Create a system of punishments and rewards to maintain order and justice."),
                Question(question: " The mortals complain about the lack of knowledge and education.",
                         firstAnswer: "Seek Athena's help in creating schools and educational institutions.",
                         secondAnswer: "Invite wise men and teachers to educate people in various sciences and arts.",
                         thirdAnswer: "Create libraries and archives so that people can access knowledge and information."),
                Question(question: "The mortals complain about the lack of medical care and treatment.",
                         firstAnswer: "Seek Asclepius's help in creating medical institutions and clinics.",
                         secondAnswer: "Invite doctors and healers to treat the sick and injured.",
                         thirdAnswer: "Create systems for training and preparing new doctors and healers."),
                Question(question: "The mortals complain about the lack of safety and protection.",
                         firstAnswer: "Seek Ares's help in creating an army and security forces.",
                         secondAnswer: "Appoint brave and experienced warriors to protect cities and settlements.",
                         thirdAnswer: "Create systems for training and preparing new warriors and defenders."),
                Question(question: "The mortals are grateful for your help and offer you a choice to further support them:",
                         firstAnswer: "Establish a council of wise elders to guide the people and maintain harmony.",
                         secondAnswer: "Create a network of community centers where people can gather, learn, and support each other.",
                         thirdAnswer: "Found a new cult dedicated to the worship of the gods to ensure their continued blessings and protection."
                        )
            ],
                     finales: ["After the successful completion of the trials, Olympus is reborn in new splendor. The gods and mortals work together to restore and improve the sacred place. Zeus is pleased with the results and promises that Olympus will continue to prosper under his guidance.",
                              "The rebirth of Olympus begins, but not everyone agrees with the changes. Some gods and mortals believe that traditions should be preserved. Zeus organizes discussions and votes to find a compromise and satisfy all participants.",
                              "The rebirth of Olympus is successful, but new threats are revealed that could jeopardize what has been achieved. Zeus decides to create a special group of defenders of Olympus who will ensure the safety and prosperity of the sacred place."]
                    )
        ]
    }
}
