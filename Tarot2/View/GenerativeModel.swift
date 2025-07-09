//
//  GenerativeModel.swift
//  Tarot2
//
//  Created by stuard bolaños on 09/07/25.
//

import FirebaseVertexAI
import FirebaseAI

// Initialize the Vertex AI service
let ai = FirebaseAI.firebaseAI(backend: .googleAI())
let generationConfig = GenerationConfig(
    temperature: 0.8, // Entre 0.7 y 0.9 para creatividad controlada
    topP: 0.9,        // Entre 0.8 y 0.95
    topK: 60,         // Entre 40 y 80
    maxOutputTokens: 800 // Ajusta según la longitud deseada
)

let safetySettings = [
    SafetySetting(harmCategory: .sexuallyExplicit, threshold: .blockLowAndAbove),
    SafetySetting(harmCategory: .hateSpeech, threshold: .blockMediumAndAbove)
    // Agrega más
]

// Create a GenerativeModel instance with a model that supports your use case
// For example, "gemini-pro" for text-based prompts
// Or "gemini-pro-vision" for multimodal prompts (text and images)
let model = ai.generativeModel(modelName: "gemini-2.5-flash", generationConfig: generationConfig, safetySettings: safetySettings)
