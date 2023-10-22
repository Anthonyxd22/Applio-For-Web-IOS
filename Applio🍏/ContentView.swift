import SwiftUI
import WebKit

struct WebViewContainer: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewContainer

        init(_ parent: WebViewContainer) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            // Puedes realizar acciones cuando la navegación comienza
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Puedes realizar acciones cuando la navegación se completa
        }
    }
}

struct WebViewExample: View {
    var body: some View {
        NavigationView {
            WebViewContainer(urlString: "https://huggingface.co/spaces/AnthonyxD2/Aesthetic_RVC_Inference_H_IOS")
                .navigationBarTitle("Applio🍏 For IOS", displayMode: .inline)
        }
    }
}

struct ContentView: View {
    var body: some View {
        WebViewExample()
    }
}


struct WebViewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

