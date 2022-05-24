import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import App from './App.vue'
import Home from './Home.vue'
import TokenList from './TokenList.vue'
import Token from './Token.vue'
import CreateToken from './CreateToken.vue'
import NotFound from './NotFound.vue'
import './assets/tailwind.css'

const routes = [
    { path: '/', component: Home },
    { path: '/tokens', component: TokenList },
    { path: '/tokens/:tokenSymbol', component: Token, name: 'MyTokens', },
    { path: '/token/create', component: CreateToken },
    { path: '/:pathMatch(.*)*', component: NotFound }
]

const router = createRouter({
    history: createWebHistory(),
    routes,
})

const app = createApp(App)
app.use(router)
app.use(ElementPlus)

app.mount('#app')
