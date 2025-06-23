import axios from "axios";
import { useUserStore } from '@/stores/user'
import { ElMessage } from "element-plus";

const baseURL = "http://localhost:9999";
export function reqeust(config) {
  const instance = axios.create({
    baseURL,
    timeout: 5000,
  });
  // 请求拦截
  instance.interceptors.request.use(
    // 封装token
    (config) => {
      const userStore = useUserStore()
      if (userStore.token) {
        config.headers.Authorization = `${userStore.token}`;
      }
      return config;
    },
    (err) => {
      return Promise.reject(err);
    }
  );
  // 响应拦截器
  instance.interceptors.response.use(
    (res) => {
      // 支持多种成功状态码
      if (res.data.code == 0 || res.data.code == 200 || res.data.code == "0" || res.data.code == "200") {
        return res.data;
      }
      // 业务请求异常
      ElMessage.error(res.data.msg ?? '服务异常');
      if (res.data.code == 1008) {
        const userStore = useUserStore()
        userStore.setToken(null)
        // 移除router跳转，让组件自己处理
        console.warn('Token已过期，请重新登录')
      }
      return Promise.reject(res.data);
    },
    (err) => {
      return Promise.reject(err);
    }
  );

  return instance(config);
}

export function get(url, params) {
  return reqeust({
    url,
    method: "get",
    params,
  });
}
export function post(url, data) {
  console.log('发送POST请求:', url, data)
  
  return reqeust({
    url,
    method: "post",
    data: data,
    headers: {
      'Content-Type': 'application/json'
    }
  });
}
export function put(url, data) {
  return reqeust({
    url,
    method: "put",
    data:JSON.stringify(data),
    headers: {
      'Content-Type': 'application/json'
    }
  });
}
export function del(url, data) {
  return reqeust({
    url,
    method: "delete",
    data:JSON.stringify(data),
    headers: {
      'Content-Type': 'application/json'
    }
  });
}
export { baseURL };