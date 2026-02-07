// ano no rodapé
document.getElementById('currentYear').textContent = new Date().getFullYear();


// apenas números

// CPF
document.getElementById('cpf').addEventListener('input', e => {
    e.target.value = e.target.value.replace(/\D/g, '');
});
// Telefone
document.getElementById('phone-num').addEventListener('input', e => {
    e.target.value = e.target.value.replace(/\D/g, '');
});
// CEP
document.getElementById('cep').addEventListener('input', e => {
    e.target.value = e.target.value.replace(/\D/g, '');
});
// Data (DD/MM/AAAA)
document.getElementById("b-date").addEventListener("input", e => {

    let v = e.target.value.replace(/\D/g, "");
    if (v.length > 8) v = v.slice(0, 8);
    if (v.length >= 5) {
        v = v.replace(/(\d{2})(\d{2})(\d+)/, "$1/$2/$3");
    } 
    else if (v.length >= 3) {
        v = v.replace(/(\d{2})(\d+)/, "$1/$2");
    }

    e.target.value = v;
});


function validaCPF(cpf) {

    if (cpf.length !== 11) return false;
    if (/^(\d)\1{10}$/.test(cpf)) return false;

    let soma = 0;

    for (let i = 0; i < 9; i++) {
        soma += cpf[i] * (10 - i);
    }

    let resto = (soma * 10) % 11;

    if (resto === 10) resto = 0;
    if (resto !== Number(cpf[9])) return false;

    soma = 0;

    for (let i = 0; i < 10; i++) {
        soma += cpf[i] * (11 - i);
    }

    resto = (soma * 10) % 11;

    if (resto === 10) resto = 0;
    if (resto !== Number(cpf[10])) return false;

    return true;
}


// Buscar CEP
const botaoBuscar = document.getElementById("buscarCep");
const resultados = document.getElementById("resultadosCep");

function buscarCEP(estado, cidade, rua) {

    if (!estado || !cidade || !rua) {
        resultados.innerHTML = "<p class='warn'>Preencha os campos: Rua, Cidade e Estado.</p>";
        return;
    }

    fetch(`https://viacep.com.br/ws/${estado}/${cidade}/${rua}/json/`)
        .then(res => res.json())
        .then(dados => {

            resultados.innerHTML = "";

            if (dados.length === 0) {
                resultados.innerHTML = "<p>Nenhum CEP encontrado.</p>";
                return;
            }

            dados.forEach(item => {

                const div = document.createElement("div");

                div.classList.add("cep-item");

                div.innerHTML = `
                    <p>
                        ${item.logradouro} - ${item.bairro}<br>
                        ${item.localidade}/${item.uf}<br>
                        CEP: ${item.cep}
                    </p>
                `;

                div.onclick = () => {
                    document.getElementById("cep").value = item.cep;
                    resultados.innerHTML = "";
                };

                resultados.appendChild(div);
            });
        });
}

botaoBuscar.addEventListener("click", e => {

    e.preventDefault();

    buscarCEP(
        document.getElementById("estado").value,
        document.getElementById("city").value,
        document.getElementById("street").value
    );
});


// Validação no envio
const form = document.querySelector("form");

form.addEventListener("submit", e => {

    e.preventDefault();

    let valido = true;

    document.querySelectorAll(".warn").forEach(w => w.textContent = "");
    document.querySelectorAll("input, select").forEach(el =>
        el.classList.remove("input-error")
    );

    const nome = document.getElementById("name");
    if (nome.value.trim() === "") {
        erro(nome, "Informe seu nome");
        valido = false;
    }

    const cpf = document.getElementById("cpf");
    if (!validaCPF(cpf.value)) {
        erro(cpf, "CPF inválido");
        valido = false;
    }

    const telefone = document.getElementById("phone-num");
    if (telefone.value.replace(/\D/g, "").length < 10) {
        erro(telefone, "Telefone inválido");
        valido = false;
    }

    const sexo = document.getElementById("sex");
    if (sexo.value === "") {
        erro(sexo, "Selecione");
        valido = false;
    }

    const cep = document.getElementById("cep");
    if (cep.value.replace(/\D/g, "").length !== 8) {
        erro(cep, "CEP inválido");
        valido = false;
    }

    const email = document.getElementById("email");
    if (!email.checkValidity()) {
        erro(email, "Email inválido");
        valido = false;
    }

    const senha = document.getElementById("passw");
    const repetir = document.getElementById("rpassw");
    if (!validarSenha(senha.value)) {
        erro(senha, "Senha fraca");
        valido = false;
    }
    if (senha.value !== repetir.value) {
        erro(repetir, "Senhas diferentes");
        valido = false;
    }
    
    if (valido) {

        const apelido = document.getElementById("username").value;
        const data = document.getElementById("b-date").value;

        const hoje = new Date();
        const nasc = new Date(data);

        let idade = hoje.getFullYear() - nasc.getFullYear();

        if (
            hoje.getMonth() < nasc.getMonth() ||
            (hoje.getMonth() === nasc.getMonth() &&
            hoje.getDate() < nasc.getDate())
        ) {
            idade--;
        }

        if (idade < 18) {

            window.location.href =
                `menorIdade.html?user=${apelido}&age=${idade}`;

        } else {

            window.location.href =
                `maiorIdade.html?user=${apelido}`;

        }
    }

});


document.getElementById("passw").addEventListener("input", e => {

    const s = e.target.value;

    document.getElementById('req-length').classList.toggle('valid', s.length >= 8);
    document.getElementById('req-upper').classList.toggle('valid', /[A-Z]/.test(s));
    document.getElementById('req-lower').classList.toggle('valid', /[a-z]/.test(s));
    document.getElementById('req-number').classList.toggle('valid', /[0-9]/.test(s));
    document.getElementById('req-special').classList.toggle('valid', /[!@#$%^&*(),.?":{}|<>]/.test(s));
});


function validarSenha(s) {

    return s.length >= 8 &&
        /[A-Z]/.test(s) &&
        /[a-z]/.test(s) &&
        /[0-9]/.test(s) &&
        /[!@#$%^&*(),.?":{}|<>]/.test(s);
}

function erro(input, msg) {

    input.classList.add("input-error");
    const span = input.parentElement.querySelector(".warn");
    span.textContent = msg;
    input.focus();
}

function togglePassword(id) {

    const input = document.getElementById(id);
    const eye = document.getElementById("eye-" + id);

    if (input.type === "password") {
        input.type = "text";
        eye.src = "eye.svg";
    } else {
        input.type = "password";
        eye.src = "eye-slash.svg";
    }
}
