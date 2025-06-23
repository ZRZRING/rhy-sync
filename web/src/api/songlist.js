import { get, post, put, del } from './request';

export const getSonglist = (params) => get('/songlist', params);
export const getSonglistDetail = (id) => get(`/songlist/${id}`);
export const addSonglist = (data) => post('/songlist', data);
export const updateSonglist = (id, data) => put(`/songlist/${id}`, data);
export const deleteSonglist = (id) => del(`/songlist/${id}`);
export const addSongToSonglist = (songlistId, songData) => post(`/songlist/${songlistId}/songs`, songData);
export const removeSongFromSonglist = (songlistId, songId) => del(`/songlist/${songlistId}/songs/${songId}`);
export const updateSongsInSonglist = (songlistId, data) => put(`/songlist/${songListId}/songs`, data);