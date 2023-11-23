//
//  SearchBar.swift
//  HealthMini
//
//  Created by Mattia De Franco on 22/11/23.
//

import SwiftUI
import Speech

struct SearchBar: View {
    @Binding var searchText: String
    @State private var isRecording = false
    @State private var recordedText = ""
    @State private var shouldCancelRecognition = false
    @ObservedObject var categoryViewModel = CategoryViewModel() // Add the CategoryViewModel

    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(EdgeInsets(top: 8, leading: 30, bottom: 8, trailing: 8))
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .autocapitalization(.none)
                .keyboardType(.webSearch)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(.systemGray))
                            .padding(.leading, 8)
                        Spacer()
                        Button(action: {
                            if isRecording {
                                stopRecording()
                            } else {
                                startRecording()
                            }
                        }) {
                            Image(systemName: isRecording ? "mic.fill" : "mic")
                                .foregroundColor(Color(.systemGray))
                                .padding(.trailing, 8)
                        }
                    }
                )
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                }
        }
    }


    private func startRecording() {
        guard SFSpeechRecognizer.authorizationStatus() == .authorized else {
            requestSpeechAuthorization()
            return
        }

        isRecording = true
        recordedText = ""
        shouldCancelRecognition = false

        let recognizer = SFSpeechRecognizer()
        let request = SFSpeechAudioBufferRecognitionRequest()

        try? AVAudioSession.sharedInstance().setCategory(.record, mode: .measurement, options: .duckOthers)
        let inputNode = AVAudioEngine().inputNode

        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            request.append(buffer)
        }

        let audioEngine = AVAudioEngine()
        audioEngine.inputNode.removeTap(onBus: 0)

        audioEngine.prepare()
        try? audioEngine.start()

        let recognitionTask = recognizer?.recognitionTask(with: request) { result, _ in
            if let result = result {
                if !self.shouldCancelRecognition {
                    self.recordedText = result.bestTranscription.formattedString
                }
            }
        }

        recognitionTask?.cancel()
    }

    private func stopRecording() {
        isRecording = false
        shouldCancelRecognition = true

        AVAudioEngine().stop()
        AVAudioEngine().inputNode.removeTap(onBus: 0)

        let recognizer = SFSpeechRecognizer()
        recognizer?.recognitionTask(with: SFSpeechAudioBufferRecognitionRequest()) { result, _ in
            if let result = result {
                self.searchText = result.bestTranscription.formattedString
            }
        }
    }

    private func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { status in
            if status == .authorized {
                startRecording()
            }
        }
    }
    private func filteredCategoriesAndSubcategories() -> [CustomCategory] {
        if searchText.isEmpty {
            // Se la stringa di ricerca è vuota, restituisci tutte le categorie come CustomCategory
            return categoryViewModel.category.map { CustomCategory(category: $0) }
        } else {
            let filteredCategories = categoryViewModel.category
                .filter { $0.name.localizedCaseInsensitiveContains(searchText) }
                .map { CustomCategory(category: $0) }

            let filteredSubcategories = categoryViewModel.category
                .flatMap { $0.subcategories }
                .filter { $0.name.localizedCaseInsensitiveContains(searchText) }
                .map { CustomCategory(subcategory: $0) }

            return filteredCategories + filteredSubcategories
        }
    }

    }

