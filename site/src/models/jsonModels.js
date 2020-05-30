const path = require('path');
const fs = require('fs');

//hacemos una funcion que retorne un objeto literal con un monton de funcionalidades dentro
function jsonModel(name) {

    return {
        archivo: path.join(__dirname, '..', 'data', name + '.json'),
        getAll: function () {
            const data = fs.readFileSync(this.archivo, 'utf-8');

            if (data.length > 0) {
                return JSON.parse(data);
            }

            return [];
        },

        save: function (newData) {
            const data = this.getAll()

            const dataAEscribir = [...data, newData];

            fs.writeFileSync(this.archivo, JSON.stringify(dataAEscribir, null, ' '));

        },

        nextId: function () {
            const data = this.getAll();

            if (data.length == 0) {
                return 1;
            }

            const ultimo = data[data.length - 1];

            let ultimoId = ultimo.id + 1;

            return ultimoId;
        },

        findBySomething: function (callback) {
            const data = this.getAll()

            const objetoEncontrado = data.find(callback);

            return objetoEncontrado;
        },
    }
}


module.exports = jsonModel;
