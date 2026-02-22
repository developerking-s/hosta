import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { I18nProvider } from "@/lib/i18n";
import { AuthProvider } from "@/lib/auth";
import Index from "./pages/Index";
import Login from "./pages/Login";
import Register from "./pages/Register";
import Plans from "./pages/Plans";
import Support from "./pages/Support";
import About from "./pages/About";
import Legal from "./pages/Legal";
import Terms from "./pages/Terms";
import Dashboard from "./pages/Dashboard";
import ApiDocs from "./pages/ApiDocs";
import HelpCenter from "./pages/HelpCenter";
import Status from "./pages/Status";
import Blog from "./pages/Blog";
import PterodactylPanel from "./pages/PterodactylPanel";
import NotFound from "./pages/NotFound";

const queryClient = new QueryClient();

const App = () => (
  <QueryClientProvider client={queryClient}>
    <BrowserRouter>
      <AuthProvider>
        <I18nProvider>
          <TooltipProvider>
            <Toaster />
            <Sonner />
            <Routes>
              <Route path="/" element={<Index />} />
              <Route path="/login" element={<Login />} />
              <Route path="/register" element={<Register />} />
              <Route path="/plans" element={<Plans />} />
              <Route path="/support" element={<Support />} />
              <Route path="/about" element={<About />} />
              <Route path="/legal" element={<Legal />} />
              <Route path="/terms" element={<Terms />} />
              <Route path="/dashboard" element={<Dashboard />} />
              <Route path="/docs" element={<ApiDocs />} />
              <Route path="/help" element={<HelpCenter />} />
              <Route path="/status" element={<Status />} />
              <Route path="/blog" element={<Blog />} />
              <Route path="/pterodactyl" element={<PterodactylPanel />} />
              <Route path="*" element={<NotFound />} />
            </Routes>
          </TooltipProvider>
        </I18nProvider>
      </AuthProvider>
    </BrowserRouter>
  </QueryClientProvider>
);

export default App;
