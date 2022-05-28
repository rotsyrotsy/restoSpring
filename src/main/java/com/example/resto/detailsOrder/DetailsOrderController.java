package com.example.resto.detailsOrder;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.resto.categorie.Categorie;
import com.example.resto.categorie.CategorieService;
import com.example.resto.controlle.Controle;
import com.example.resto.order.OrderrController;
import com.example.resto.plat.PlatService;
import com.example.resto.serveur.Serveur;
import com.example.resto.serveur.ServeurService;
import com.example.resto.stock.StockService;

@RestController
@RequestMapping(path = "/detailsOrders")
public class DetailsOrderController {

    @Autowired
    private StockService stockService;
    @Autowired
    private CategorieService catservice;

    @Autowired
    private PlatService platservice;

    @Autowired
    private DetailsOrderService service;

    @Autowired
    private ServeurService servservice;

    @Autowired
    private OrderrController orderController;

    public DetailsOrderController(DetailsOrderService service) {
        this.service = service;
    }

    @GetMapping("/choixServeurPourboire")
    public ModelAndView selectServeur(Model model) {
        List<Serveur> listeServeurs = servservice.getAllServeurs();

        model.addAttribute("listServeur", listeServeurs);
        model.addAttribute("view", "bo_selectPourboire");
        return new ModelAndView("back/bo_template");
    }

    @GetMapping("/choixServeurBase")
    public ModelAndView resultServeur2(Model model,
            @RequestParam(required = true) String serveur,
            @RequestParam(required = true) java.sql.Date date1,
            @RequestParam(required = true) java.sql.Date date2) throws ParseException {
        List<HashMap<String, Object>> liste = service.getPrixOrderServeur(serveur, date1, date2);

        Double sum = 0.0;
        for (int i = 0; i < liste.size(); i++) {
            HashMap<String, Object> temp = liste.get(i);
            sum += (Double) temp.get("pourcentage");
        }
        model.addAttribute("sum", sum);
        model.addAttribute("listOrder", liste);
        model.addAttribute("view", "bo_resultPourboire");
        return new ModelAndView("back/bo_template");
    }

    @GetMapping(path = "/insert")
    public ModelAndView ajout(Model model, @RequestParam String idPlat,
            ServletRequest request) throws Exception {

        String idOrder = null;
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        if (session.getAttribute("sessionOrder") != null) {
            HashMap<String, Object> order = (HashMap<String, Object>) session.getAttribute("sessionOrder");

            idOrder = (String) order.get("idOrder");
        }

        try {

            service.insertDetailsOrder(idPlat, idOrder);

            model.addAttribute("succes", "Commande du plat id " + idPlat + " réussi");

        } catch (Exception ex) {
            ex.printStackTrace();
            model.addAttribute("error", ex.getMessage());
        } finally {
            List<HashMap<String, Object>> listPlat = platservice.getAllPlats();
            List<Categorie> listCategorie = catservice.getAllCategories();

            model.addAttribute("listPlat", listPlat);
            model.addAttribute("listCategorie", listCategorie);
            model.addAttribute("view", "menu");
        }

        return new ModelAndView("template");
    }

    @GetMapping(path = "/valider")
    public ModelAndView selectDetailsOrderValide(Model model) {
        List<HashMap<String, Object>> listedo = service.getDetailsOrderValide();
        model.addAttribute("platsValide", listedo);
        model.addAttribute("view", "bo_platsValider");
        return new ModelAndView("back/bo_template");
    }

    @GetMapping(path = "/enPreparation")
    public ModelAndView selectDetailsOrderEnPreparation(Model model) {
        List<HashMap<String, Object>> listeprep = service.getDetailsOrderPrep();

        model.addAttribute("platsEnPreparation", listeprep);
        model.addAttribute("view", "bo_platsEnPreparation");
        return new ModelAndView("back/bo_template");

    }

    @GetMapping(path = "/prets")
    public ModelAndView selectDetailsOrderPret(Model model) {
        List<HashMap<String, Object>> listeprep = service.getDetailsOrderPret();

        model.addAttribute("platsPrets", listeprep);
        model.addAttribute("view", "bo_platsPrets");
        return new ModelAndView("back/bo_template");

    }

    @GetMapping(path = "/changeToEnPreparation")
    public ModelAndView changeEnPrep(Model model, @RequestParam String idDetailOrder) {

        service.changeToEnPreparation(idDetailOrder);

        List<HashMap<String, Object>> listedo = service.getDetailsOrderValide();
        model.addAttribute("platsValide", listedo);
        model.addAttribute("view", "bo_platsValider");
        return new ModelAndView("back/bo_template");

    }

    @GetMapping(path = "/changeToPret")
    public ModelAndView changeToPret(Model model, @RequestParam String idDetailOrder) {

        service.changeToPret(idDetailOrder);
        String idPlat = service.getIdPlat(idDetailOrder);
        stockService.insertStock(idPlat);

        List<HashMap<String, Object>> listedo = service.getDetailsOrderPrep();
        model.addAttribute("platsEnPreparation", listedo);
        model.addAttribute("view", "bo_platsEnPreparation");
        return new ModelAndView("back/bo_template");
    }

    @GetMapping(path = "/annuler/{idDetailOrder}")
    public ModelAndView annulerCommande(Model model, @PathVariable("idDetailOrder") String idDetailOrder, ServletRequest request) throws ParseException {
        service.annulerCommande(idDetailOrder);
        return orderController.commandeEnCours(model, request);
    }

}
