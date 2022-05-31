import moment from 'moment';

export default {
    TimeAgo : {
        date: 0,
        timer: null,
        mounted(){
            this.date = moment.utc(this.el.getAttribute('datetime'));
            this.updateTime();
        },
        destroyed() {
            clearTimeout(this.timer);
        },
        updateTime(){
            let nextUpdate = moment.utc().local().diff(this.date) / 1000;

            if (nextUpdate < 60){
                nextUpdate = 1;
            }else if(nextUpdate < 60*60){
                nextUpdate = 60;
            }else {
                nextUpdate = 60 * 60;
            }

            this.el.innerText = this.date.fromNow();
            this.timer = setTimeout(()=>{
                this.updateTime();
            }, nextUpdate * 1000);
        }
    }
}