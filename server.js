const express = require("express")
const bodyParser = require("body-parser")
const app = express()
const mongoose=require('mongoose')
app.use(bodyParser.json())


// let livres = [
//     { id: 1, titre: 'Le Petit Prince', auteur: 'Antoine de Saint-Exupéry', annee: 1943 },
//     { id: 2, titre: '1984', auteur: 'George Orwell', annee: 1949 },
//     { id: 3, titre: 'L\'Étranger', auteur: 'Albert Camus', annee: 1942 }
// ]

app.listen(3000, () => {
    console.log('server listening on port 3000')
})
mongoose.connect('mongodb://localhost:27017/bibliotheque').then(()=>{ console.log('connexion à mongodb réussie')}).catch((error)=>{ console.error('erreur de connexion à Mongodb',error)})
const livreSchema= new mongoose.Schema({
    //id :{type : Int, required : true},
    titre :{type : String, required : true},
    auteur :{type : String, required : true},
    annee :{type : Number, required : true}
})

const Livre=mongoose.model('Livre',livreSchema)
app.get('/livres', async (req, res) => {
    // if(req.header("x-description-route-client")==null){
    //     res.status(400).send('header manquant')
    // }
    try
    {
        const livres= await Livre.find()
        res.status(200).send(livres)
    }catch(error)
    {
        res.status(500).send("Erreur lors de la récupération des livres")
    }
    //console.log(req.header("x-description-route-client"))
    //res.set("x-description-route-server", req.header("x-description-route-client"))
})


app.get('/livres/:id', async(req, res) => {
    // if(req.header("x-description-route-client")==null){
    //     res.status(400).send('header manquant')
    // }
    //console.log(req.header("x-description-route-client"));
    try
    {
        const livre= await Livre.findById(req.params.id)
        if(!livre){
            return res.status(404).send("livre non trouvé");
        }
        res.status(200).send(livre);

    }
    catch(error){
        res.status(500).send("Erreur lors de la récupération des livres")
    }
    // const id = req.params.id;
    // for (i = 0; i < livres.length; i++) {
    //     if (livres[i].id == id) {
    //         res.status(200).send(livres[i]);
    //     }
    // }
    // if (id >= livres.length) {
    //     res.status(404).send("livre non trouvé");
    // }

    //res.set("x-description-route-server", req.header("x-description-route-client"));
});


app.post('/livres', async(req, res) => {
    // console.log(req.header("x-description-route-client"));
    // const id = req.body.id;
    // const titre = req.body.titre;
    // const auteur = req.body.auteur;
    // const annee = req.body.annee;

    // const newLivre =
    // {
    //     id: id,
    //     titre: titre,
    //     auteur: auteur,
    //     annee: annee
    // };

    try
    {
        const nouveaulivre= new Livre(req.body)
        console.log(nouveaulivre)
        await nouveaulivre.save()
        res.status(201).send("livre ajouté avec succès")
    }catch(error){
        res.status(400).send("Erreur lors de l'ajout du livre")
    }
    // if(req.header("x-description-route-client")==null){
    //     res.status(400).send('header manquant')
    // }

    // if (id == null || titre == null || auteur == null || annee == null) {
    //     res.status(400).send("ressource incorrect");
    // }
    // else {
    //     livres.push(newLivre);
    //     res.set("x-description-route-server", req.header("x-description-route-client"));
    //     res.status(201).send("sent");
    // }

});


app.put('/livres/:id', async(req, res) => {
    // if(req.header("x-description-route-client")==null){
    //     res.status(400).send('header manquant')
    // }
    // console.log(req.header("x-description-route-client"));
    // const id = req.params.id;
    try{
        const livre= await Livre.findByIdAndUpdate(req.params.id,req.body)
        if(!livre){
            return res.status(404).send("livre non trouvé")
        }
        res.status(200).send("livre modifié avec succès")
    }catch(error){
        res.status(400).send("Erreur lors de la modification du livre")
    }
    
    // if (req.body.titre == null && req.body.auteur == null && req.body.annee == null) {
    //     res.status(400).send("modification non effectuée");
    // }
    // if (id >= livres.length) {
    //     res.status(404).send("livre non trouvé")
    // }
    // for (i = 0; i < livres.length; i++) {
    //     if (livres[i].id == id) {
    //         livres[i].titre = req.body.titre || livres[i].titre
    //         livres[i].auteur = req.body.auteur || livres[i].auteur
    //         livres[i].annne = req.body.annee || livres[i].annee
    //     }
    // }
    // res.set("x-description-route-server", req.header("x-description-route-client"));
    // res.status(200).send("livre modifié avec succès")
});


app.delete('/livres', async(req, res) => {
    // if(req.header("x-description-route-client")==null){
    //     res.status(400).send('header manquant')
    // }
    // console.log(req.header("x-description-route-client"));
    // livres.length = 0
    // res.set("x-description-route-server", req.header("x-description-route-client"));
    // res.status(204).send("livres supprimés")
    try{
        await Livre.deleteMany({})
        res.status(204).send("livres supprimés")
    }
    catch(error){
        res.status(500).send("Erreur lors de la suppression des livres")
    }
}) 

app.delete('/livres/:id', async(req,res)=>{
    // if(req.header("x-description-route-client")==null){
    //     res.status(400).send('header manquant')
    // }
    // console.log(req.header("x-description-route-client"));
    // const id= req.params.id
    
    //   for(i=0;i<livres.length;i++)
    //     {
    //     if(livres[i].id==id)
    //     {
    //       livres.splice(i,1);
    //     }
    //   res.set("x-description-route-server",req.header("x-description-route-client"));
    //   res.status(204).send("Livre supprimé")
    // }
    // if(id>=livres.length)
    // {
    //   res.status(404).send("Livre non trouvé")
    // }
    try{
        const livre= await Livre.findByIdAndDelete(req.params.id)
        if(!livre){
            return res.status(404).send("livre non trouvé")
        }
        res.status(204).send("livre supprimé avec succès")
    }
    catch(error){
        res.status(500).send("Erreur lors de la suppression du livre")
    }
  })